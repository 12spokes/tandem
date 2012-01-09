module Tandem
  class Image < ActiveRecord::Base

    THUMB_WIDTH = 150
    THUMB_HEIGHT = 150

    has_attached_file :resource, :styles => { :thumb => "150x150>" },
                      :url  => Tandem::Configuration.uploaded_images_template,
                      :path => Tandem::Configuration.uploaded_images_dir + Tandem::Configuration.uploaded_images_template

    validates_attachment_presence :resource
    validates_attachment_size :resource, :less_than => 200.kilobytes
    validates_attachment_content_type :resource, :content_type => ['image/jpeg', 'image/png']

    has_many :content_images, class_name: 'Tandem::Content::Image'
  end
end
