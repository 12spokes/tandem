module TandemContentsHelper
  def display_tandem_content(tandem_content)
    content_tag(:div, :class => 'tandem_content') do
      content = send("display_#{tandem_content.resource_type.underscore}", tandem_content.resource)
      content += tandem_manage_links(tandem_content) if can_edit_tandem_content?
      content
    end
  end
  
  def display_tandem_text(tandem_text)
    content_tag(:div, tandem_text.content, :class => 'tandem_text')
  end
  
  def tandem_manage_links(tandem_content)
    content_tag(:div, :class => 'tandem_manage_links') do
      content = link_to 'Edit', edit_tandem_page_tandem_content_path(tandem_content.tandem_page, tandem_content)
      content += ' '
      content += link_to 'Delete', tandem_page_tandem_content_path(tandem_content.tandem_page, tandem_content), :confirm => 'Are you sure?', :method => :delete 
    end
  end
end
