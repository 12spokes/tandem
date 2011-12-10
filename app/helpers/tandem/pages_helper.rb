module Tandem
  module PagesHelper
    # tandem_content_tag creates an HTML DIV element with id and class parameters that
    # relate to the specified Tandem Content object and contains an internal content element.
    # If a Tandem::Content record doesn't exist for the unique combination of:
    # page, identifier and type, one will be created automatically. For example:
    #
    #    <%= tandem_content_tag(@page, :test_image, :image) %>
    #
    # would find_or_create a Tandem::Content::Image object and produce the following HTML
    # (assuming @page is an instance of a Tandem::Page object):
    #
    #    <div class="tandem_content" id="test_image">...<img id="tandem_content_image_test_image" class="tandem_content_image bar"...</div>
    #
    # If the user is authorized to update content then an edit link will be generated in
    # conjunction with the content. For example:
    #
    #    <%= tandem_content_tag(@page, :test_text, :text) %>
    #
    # would produce the following HTML (assuming @page is an instance of a Tandem::Page object,
    # with an id value of 123, and `can? :update, tandem_content` => true):
    #
    #    <div class="tandem_content" id="test_text">
    #      <div class="tandem_toolbar" id="tandem_toolbar_test_text">
    #        <a href="#" id="tandem_edit_link_test_text" title="Edit test_text" class="tandem_edit_link" editor_options="{&quot;page_id&quot;:123,&quot;identifier&quot;:&quot;test_text&quot;,&quot;type&quot;:&quot;text&quot;}">Edit</a>
    #      </div>
    #      ....
    #    </div>
    #
    # If a user specifies link information for the corresponding Tandem::Content object,
    # then an A HTML element will be generated surrounding the content. For example:
    #
    #    <%= tandem_content_tag(@page, :test_image, :image) %>
    #
    # produces (assuming that tandem_content.link? => true):
    #
    #    <div class="tandem_content" id="test_image">
    #      ...
    #      <a id="tandem_content_link_test_image" class="tandem_content_link" ...
    #        <img id="tandem_content_image_test_image" class="tandem_content_image" ...
    #      </a>
    #    </div>
    #
    # tandem_content_tag accepts a hash of html_options, which will be converted to
    # additional HTML attributes of the generated container div. If you specify a <tt>:class</tt> value, it will be combined
    # with the default class name for your object. For example:
    #
    #    <%= tandem_content_tag(@page, :test_image, :image, {}, :class => "bar", :style => 'display:none') %>...
    #
    # produces:
    #
    #    <div class="tandem_content bar" id="test_image" style = "display:none">...
    #
    # tandem_content_tag also accepts a hash of options, which will be converted to
    # additional HTML attributes of the internal asset type. If you specify a <tt>:class</tt> value, it will be combined
    # with the default class name for your object. For example:
    #
    #    <%= tandem_content_tag(@page, :test_image, :image, :class => "bar", :width => 80) %>...
    #
    # produces:
    #
    #    ...<img id="tandem_content_image_test_image" class="tandem_content_image bar" width = "80"...
    #
    def tandem_content_tag(page, identifier, type, options = {}, html_options = {})
      content = case tandem_content = page.contents.find_or_create_by_tag_and_type(identifier,Content.scoped_type(type))
        when Content::Text
          content_tag(:div, tandem_content, {
              id: "#{dom_class(tandem_content)}_#{identifier}",
              class: "#{dom_class(tandem_content)} #{options.delete(:class)}".strip
          }.merge(options)) {
            tandem_content.formatted_text.html_safe
          }
        when Content::Image
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
        link_to("Edit",edit_page_content_path(@page.id,tandem_content.id),{
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
      # tandem_#{klass.simple_type}_tag is provided as an alias of tandem_content_tag,
      # specifying the type of content through the method name. For example:
      #
      #    <%= tandem_image_tag(@page, :test_image) %>
      #
      # is equivalent to:
      #
      #    <%= tandem_content_tag(@page, :test_image, :image) %>
      #
      define_method "tandem_#{klass.simple_type}_tag" do |page, identifier, options = {}, html_options = {}|
        tandem_content_tag page, identifier, klass.simple_type, options, html_options
      end
    end
  end
end
