module Tandem
  class Image < ActiveRecord::Base

    THUMB_WIDTH = 150
    THUMB_HEIGHT = 150

    has_attached_file :resource, Tandem::Configuration.paperclip_options

    validates_attachment_presence :resource
    validates_attachment_size :resource, :less_than => 200.kilobytes
    validates_attachment_content_type :resource, :content_type => ['image/gif', 'image/jpg', 'image/jpeg', 'image/png']

    has_many :content_images, class_name: 'Tandem::Content::Image'

    default_scope order('created_at DESC')

    def thumb_url
      resource.url(:thumb)
    end

    def as_json(options={})
      super(:methods => :thumb_url)
    end
  end
end
