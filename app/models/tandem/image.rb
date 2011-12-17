module Tandem
  class Image < ActiveRecord::Base
    has_attached_file :resource, :styles => { :thumb => "150x150>" },
                      :url  => "/assets/images/:id/:style/:basename.:extension",
                      :path => ":rails_root/public/assets/images/:id/:style/:basename.:extension"

    validates_attachment_presence :resource
    validates_attachment_size :resource, :less_than => 200.kilobytes
    validates_attachment_content_type :resource, :content_type => ['image/jpeg', 'image/png']
  end
end
