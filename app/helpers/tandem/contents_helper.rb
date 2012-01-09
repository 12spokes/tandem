module Tandem
  module ContentsHelper

    def image_content_url(image_content, format = nil)
      image_content.image.present? ?
          image_content.image.resource.url(format) :
          'tandem/blank_image.jpg'
    end

    def image_content_tag(image_content, options = {}, format = nil)
      options = {style: "height:#{Tandem::Image::THUMB_HEIGHT}px;width:#{Tandem::Image::THUMB_WIDTH}px;border:5px solid #ccc;"}.merge(options) if format == :thumb
      image_tag image_content_url(image_content, format), options
    end
  end
end
