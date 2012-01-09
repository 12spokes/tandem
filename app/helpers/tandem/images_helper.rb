module Tandem
  module ImagesHelper

    def tandem_image_tag(image, options = {}, format = nil)
      options = {style: "height:#{Tandem::Image::THUMB_HEIGHT}px;width:#{Tandem::Image::THUMB_WIDTH}px;border:5px solid #ccc;"}.merge(options) if format == :thumb
      image_tag image.resource.url(format), options
    end

  end
end
