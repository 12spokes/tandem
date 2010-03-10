module TandemContentsHelper
  def display_tandem_content(tandem_content)
    send("display_#{tandem_content.resource_type.underscore}", tandem_content.resource)
  end
  
  def display_tandem_text(tandem_text)
    tandem_text.content
  end
end
