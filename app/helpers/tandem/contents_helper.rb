module Tandem
  module ContentsHelper

    def image_content_url(image_content, format = :original)
      image_content.image.present? ? image_content.image.resource.url(format) : 'tandem/blank_image.jpg'
    end

<<<<<<< HEAD
    def image_content_tag(image_content, options = {}, format = :original)
      options = {style: "width:#{Tandem::Image::THUMB_WIDTH}px;border:5px solid #ccc;"}.merge(options) if format == :thumb
=======
    def image_content_tag(image_content, options = {}, format = nil)
      options = {style: ""}.merge(options) if format == :thumb
>>>>>>> [#24418185] changes to image gallery layout
      image_tag image_content_url(image_content, format), options
    end
  end
end
