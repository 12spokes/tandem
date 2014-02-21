require 'rails/generators'
require 'rails/generators/resource_helpers'

module Tandem
  module Generators
    class ResourceGenerator < ::Rails::Generators::NamedBase
      include ::Rails::Generators::ResourceHelpers

      desc "Create a tandem resource"
      
      argument :attributes, :type => :array, :default => [], :banner => "field[:type][:index] field[:type][:index]"

      hook_for :orm, :in => :rails, :as => :model, :required => true

      source_root File.expand_path('../templates', __FILE__)

      class_option :with_image, :type => :boolean, :default => false 

      def create_tandem_resource_controller
        template 'controller.rb', File.join('app/controllers', "#{controller_file_name}_controller.rb")
      end

      def create_views
        [:index, :show, :new, :edit, :_form].each do |view|
          template "#{view}.html.slim", File.join('app/views', "#{file_name.pluralize}", "#{view}.html.slim")
        end
      end

      def add_resource_route
        route "resources :#{file_name.pluralize}"
      end

      def add_image_to_model
        if options.with_image
          insert_into_file "app/models/#{file_name}.rb", :before => "end" do
            content = ""
            content += "  attr_accessible :image, :image_delete\n\n"
            content += "  has_attached_file :image, Tandem::Configuration.paperclip_options\n"
            content += "  validates_attachment_content_type :image, :content_type => %w(image/jpeg image/jpg image/png)\n\n"
            content += "  before_save :destroy_image?\n\n"
            content += "  def image_delete\n"
            content += "    @image_delete ||= '0'\n"
            content += "  end\n\n"
            content += "  def image_delete=(value)\n"
            content += "    @image_delete = value\n"
            content += "  end\n\n"
            content += "  private\n\n"
            content += "  def destroy_image?\n"
            content += "    self.image.clear if @image_delete == '1'\n"
            content += "  end\n"
          end
          insert_into_file "app/views/#{file_name}s/_form.html.slim", :after => "form_for @#{file_name}" do
            content = ""
            content += ", :html => { :multipart => true } "
          end
          generate "paperclip #{file_name} image"
        end
      end
    end
  end
end
