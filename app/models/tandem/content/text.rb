module Tandem
  class Content::Text < Content
    #alias_method :formatted_text, :content
    def formatted_text
      "<h1>Sample H1</h1><p>Sample Paragraph</p><p>Sample Paragraph</p>"
    end
  end
end
