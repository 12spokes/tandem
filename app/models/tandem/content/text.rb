module Tandem
  class Content::Text < Content
    #alias_method :formatted_text, :content
    #alias_method :formatted_text=, :content=

    def formatted_content
      content.presence || 'Sample Content'
    end
  end
end
