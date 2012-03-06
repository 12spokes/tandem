module Tandem
  class Content::Text < Content
    def formatted_content
      content.presence || '<p>Sample Content</p>'
    end
  end
end
