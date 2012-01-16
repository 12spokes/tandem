module Tandem
  module PagesHelper

    def self.included(base)
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
        base.send(:define_method, "tandem_#{klass.simple_type}_tag") do |page, identifier, options = {}, html_options = {}|
          tandem_content_tag page, identifier, klass.simple_type, options, html_options
        end
      end
    end

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
          content_tag(:div, tandem_content, options.merge(
              id: "#{dom_class(tandem_content)}_#{identifier}",
              class: "#{dom_class(tandem_content)} #{options[:class]}".strip
          )) {
            tandem_content.formatted_content.html_safe
          }
        when Content::Image
          image_content_tag(tandem_content,options.merge(
              id: "#{dom_class(tandem_content)}_#{identifier}",
              class: "#{dom_class(tandem_content)} #{options[:class]}".strip
          ))
        else
          raise "Unable to create #{tandem_content.class.name}: #{tandem_content.errors.inspect}" if tandem_content.new_record?
          raise "Rendering behavior not defined for: #{tandem_content.class.name}"
      end

      #didn't use link_to_if here for performance
      content = link_to(content,tandem_content.link_url,{
          id: "tandem_content_link_#{identifier}",
          class: "tandem_content_link",
          target: tandem_content.link_target
      }) if tandem_content.link?

      content = content_tag(:div, tandem_content, {
          id: "tandem_toolbar_#{identifier}",
          class: "tandem_toolbar #{options[:class]}".strip
      }) {
        link_to("Edit",edit_page_content_path(page.id,tandem_content.id),{
            id: "tandem_edit_link_#{identifier}",
            class: "tandem_edit_link #{options[:class]}".strip,
            title: "editing #{identifier}"
        })
      } + content if can? :update, tandem_content

      content_tag(:div, tandem_content, html_options.merge(
          id: identifier,
          class: "tandem_content #{html_options[:class]}".strip
      )) do
        content
      end
    end

    #todo... document this
    def tandem_navigation_tag(selected_page, pages_collection = nil, html_options = {})
      html_options, pages_collection = pages_collection, nil if pages_collection.is_a?(Hash)
      page_groups = (pages_collection || Page.all).inject({}) do |groups, page|
        if groups[page.parent_id.to_s]
          groups[page.parent_id.to_s] << page
        else
          groups[page.parent_id.to_s] = [page]
        end
        groups
      end

      # generate must be in scope for the iterate proc declaration, but must be defined below iterate, so that iterate is recursively in scope
      generate = nil

      iterate = Proc.new do |parent_id|
        #very important to delete the group from the collection, or it is possible users can create looping relationships
        (page_groups.delete(parent_id.to_s) || {}).inject(''.html_safe) do |buffer, page|
          buffer + generate.call(page)
        end
      end

      generate = Proc.new do |page|
        content_tag_for(:div, page, :link, class: "#{page == selected_page ? 'selected' : ''}") do
          link_to(page.link_label, page_path(page), class: "#{page == selected_page ? 'selected' : ''}") +
          content_tag(:div, class: 'children') do
            iterate.call(page.id)
          end
        end
      end

      content_tag(:div, html_options) do
        iterate.call
      end
    end

    def valid_templates
      @valid_templates ||= controller.view_paths.inject({}) do |templates,path|
        Dir["#{path}/layouts/**/*.html*"].each do |template|
          template_name = template["#{path}/layouts".length+1..-1].split('.').first
          template_path = template_name.split('/')
          if template_path.first.downcase == Configuration.layouts_dir.downcase
            template_path.shift
          else
            template_path.unshift('')
          end
          templates[template_name] = template_path.join('/')
        end
        templates
      end
    end
  end

end
