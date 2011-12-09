module Tandem
  module PagesHelper
    def tandem_content_tag(page, identifier, type, options = {}, html_options = {})
      content = case tandem_content = page.contents.find_or_create_by_tag_and_type(identifier,Content.scoped_type(type))
        when Tandem::Content::Text
          content_tag(:div, tandem_content, {
              id: "#{dom_class(tandem_content)}_#{identifier}",
              class: "#{dom_class(tandem_content)} #{options.delete(:class)}".strip
          }.merge(options)) {
            tandem_content.formatted_text.html_safe
          }
        when Tandem::Content::Image
          image_tag(tandem_content.image_url,{
              id: "#{dom_class(tandem_content)}_#{identifier}",
              class: "#{dom_class(tandem_content)} #{options.delete(:class)}".strip,
              width: tandem_content.image_width,
              height: tandem_content.image_height
          }.merge(options))
        else
          raise "Rendering behavior not defined for: #{Content.scoped_type(type)}"
      end

      #didn't use link_to_if here for performance
      content = link_to(content,tandem_content.link_url,{
          id: "tandem_content_link_#{identifier}",
          class: "tandem_content_link",
          target: tandem_content.link_target
      }) if tandem_content.link?

      content = content_tag(:div, tandem_content, {
          id: "tandem_toolbar_#{identifier}",
          class: "tandem_toolbar #{options.delete(:class)}".strip
      }) {
        link_to("Edit","#",{
            id: "tandem_edit_link_#{identifier}",
            class: "tandem_edit_link #{options.delete(:class)}".strip,
            title: "Edit #{identifier}",
            editor_options: {
                page_id: page.id,
                identifier: identifier,
                type: type
            }.to_json
        })
      } + content if can? :update, tandem_content

      content_tag(:div, tandem_content, {
          id: identifier,
          class: "tandem_content #{html_options.delete(:class)}".strip,
      }.merge(html_options)) do
        content
      end
    end

    Tandem::Content.subclasses.each do |klass|
      define_method "tandem_#{klass.simple_type}_tag" do |page, identifier, options = {}, html_options = {}|
        tandem_content_tag page, identifier, klass.simple_type, options, html_options
      end
    end
  end
end
