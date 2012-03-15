module Tandem
  module PagesHelper

    include ContentsHelper

    def self.included(base)
      Tandem::Content.subclasses.each do |klass|
        # tandem_#{klass.simple_type}_tag is provided as an alias of tandem_content_tag,
        # specifying the type of content through the method name. For example:
        #
        #    <%= tandem_image_tag(:test_image) %>
        #
        # is equivalent to:
        #
        #    <%= tandem_content_tag(:test_image, :image) %>
        #
        base.send(:define_method, "tandem_#{klass.simple_type}_tag") do |identifier, options = {}, html_options = {}|
          tandem_content_tag identifier, klass.simple_type, options, html_options
        end
      end
    end

    # tandem_content_tag creates an HTML DIV element with id and class parameters that
    # relate to the specified Tandem Content object and contains an internal content element.
    # If a Tandem::Content record doesn't exist for the unique combination of:
    # request_key, identifier and type, one will be created automatically. For example:
    #
    #    <%= tandem_content_tag(:test_image, :image) %>
    #
    # would find_or_create a Tandem::Content::Image object and produce the following HTML:
    #
    #    <div class="tandem_content" id="test_image">...<img id="tandem_content_image_test_image" class="tandem_content_image bar"...</div>
    #
    # If the user is authorized to update content then an edit link will be generated in
    # conjunction with the content. For example:
    #
    #    <%= tandem_content_tag(:test_text, :text) %>
    #
    # would produce the following HTML (assuming `can? :update, tandem_content` => true):
    #
    #    <div class="tandem_content" id="test_text">
    #      <div class="tandem_toolbar" id="tandem_toolbar_test_text">
    #        <a href="#" id="tandem_edit_link_test_text" title="Edit test_text" class="tandem_edit_link" editor_options="{&quot;identifier&quot;:&quot;test_text&quot;,&quot;type&quot;:&quot;text&quot;}">Edit</a>
    #      </div>
    #      ....
    #    </div>
    #
    # If a user specifies link information for the corresponding Tandem::Content object,
    # then an A HTML element will be generated surrounding the content. For example:
    #
    #    <%= tandem_content_tag(:test_image, :image) %>
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
    #    <%= tandem_content_tag(:test_image, :image, {}, :class => "bar", :style => 'display:none') %>...
    #
    # produces:
    #
    #    <div class="tandem_content bar" id="test_image" style = "display:none">...
    #
    # tandem_content_tag also accepts a hash of options, which will be converted to
    # additional HTML attributes of the internal asset type. If you specify a <tt>:class</tt> value, it will be combined
    # with the default class name for your object. For example:
    #
    #    <%= tandem_content_tag(:test_image, :image, :class => "bar", :width => 80) %>...
    #
    # produces:
    #
    #    ...<img id="tandem_content_image_test_image" class="tandem_content_image bar" width = "80"...
    #
    # Finally, text tandem_content_tags support an <tt>:editor</tt> option, which defaults to <tt>:plain</tt>, but
    # can also be changed to <tt>:wysiwyg</tt> to enable a WYSIWYG editor, e.g.
    #
    #     <%= tandem_content_tag(:main_body, :text, editor: :wysiwyg) %>
    def tandem_content_tag(identifier, type, options = {}, html_options = {})
      options[:editor] ||= :plain

      using_tandem_abilities do
        tandem_content = Content.scoped_type(type).constantize.find_or_create_by_request_key_and_tag(request_key, identifier)

        content = case tandem_content
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

        content = link_to(content,tandem_content.link_url,{
            id: "tandem_content_link_#{identifier}",
            class: "tandem_content_link",
            target: tandem_content.link_target
        }) if tandem_content.link?

        content = content_tag(:div, tandem_content, {
            id: "tandem_toolbar_#{identifier}",
            class: "tandem_toolbar #{options[:class]}".strip
        }) {
          link_to("Edit", tandem.edit_content_path(tandem_content.id, editor: options[:editor]),{
              id: "tandem_edit_link_#{identifier}",
              class: "tandem_edit_link #{options[:class]}".strip,
              title: "editing #{identifier}"
          })
        } + content if can? :update, tandem_content

        html_options.merge! id: identifier
        html_options[:class] ||= ''
        html_options[:class] << ' tandem_content' if can? :update, tandem_content
        html_options[:class].strip!

        content_tag(:div, tandem_content, html_options) { content }
      end
    end

    #todo... document this
    def tandem_navigation_tag(active_page, pages_collection = nil, html_options = {})
      html_options, pages_collection = pages_collection, nil if pages_collection.is_a?(Hash)

      html_options[:class] ||= 'nav'

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
        content_tag_for(:li, page, :link, class: "#{page == active_page ? 'active' : ''}") do
          link_to(page.link_label, tandem.page_path(page), class: "#{page == active_page ? 'active' : ''}") +
          content_tag(:ul) do
            iterate.call(page.id)
          end
        end
      end

      content_tag(:ul, html_options) do
        iterate.call(page_groups.keys.first)
      end
    end

    def tandem_page_links(options ={})
      return if cannot?(:create, @page) && cannot?(:update, @page) && cannot?(:destroy, @page)

      options[:id] ||= 'tandem_page_links'

      content_tag(:ul, options) do
        links = []
        
        if can?(:create, @page)
          links << link_to('New Page', tandem.new_page_path(parent_id: @page.id), :class => :page_link, :id => :page_new_link)
        end

        if @page.persisted? && can?(:update, @page)
          links << link_to('Edit Page', tandem.edit_page_path(@page), :class => :page_link, :id => :page_edit_link)
        end

        if @page.persisted? && can?(:destroy, @page)
          links << link_to('Destroy Page', @page, :confirm => 'Are you sure?', :method => :delete)
        end

        if can?(:index, ::Tandem::Page)
          links << link_to('Page Listing', tandem.pages_path)
        end

        links.collect! do |link|
          content_tag(:li, link)
        end

        raw(links.join)
      end
    end

    def valid_layouts
      @valid_layouts ||= Dir["#{::Rails.root}/app/views/layouts/**/*.html*"].collect do |layout|
        name = layout.match(/layouts\/([\w\-\/]*)((\.\w*){2})$/)[1]
        name unless name == 'application'
      end.compact
    end

    def valid_templates
      @valid_templates ||= Dir["#{::Rails.root}/app/views/tandem/pages/**/*.*.*"].collect do |template|
        template_name = File.basename(template).split('.').first
        template_name if valid_custom_template?(template_name)
      end.compact
    end

    private
      def invalid_templates
        ['show', 'edit', 'index', 'new']
      end

      def valid_custom_template?(template_name)
        template_name[0] != '_' && !invalid_templates.include?(template_name)
      end

      def request_key
        "#{controller_path}-#{action_name}".gsub(/[^\w]|_/, '-')
      end

      def using_tandem_abilities
        controller.instance_variable_set :@current_ability, ::Tandem::Ability.new(::Tandem::Configuration.current_user.call(request))
        yield.tap do
          controller.instance_variable_set :@current_ability, nil
        end
      end
  end
end
