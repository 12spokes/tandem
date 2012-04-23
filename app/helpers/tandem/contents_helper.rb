module Tandem
  module ContentsHelper

    def image_content_url(image_content, format = :original)
      image_content.image.present? ? image_content.image.resource.url(format) : 'tandem/blank_image.jpg'
    end

    def image_content_tag(image_content, options = {}, format = :original)
      image_tag image_content_url(image_content, format), options
    end

    def text_content_text_area_options(editor = 'plain', options = {})
      options.tap do |options|
        options[:class] = 'wymeditor' if editor == 'wysiwyg'
      end
    end
  end
end
