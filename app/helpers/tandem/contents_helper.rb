module Tandem
  module ContentsHelper

    def image_content_url(image_content, format = :original)
      image_content.image.present? ? image_content.image.resource.url(format) : 'tandem/blank_image.jpg'
    end

    def image_content_tag(image_content, options = {}, format = :original)
      options = {style: ""}.merge(options) if format == :thumb
      image_tag image_content_url(image_content, format), options
    end
  end
end
