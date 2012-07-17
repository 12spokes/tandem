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

      def create_tandem_resource_controller
        template 'controller.rb', File.join('app/controllers/tandem', "#{controller_file_name}_controller.rb")
      end

      def create_views
        [:index, :show, :new, :edit, :_form].each do |view|
          template "#{view}.html.slim", File.join('app/views/tandem', "#{file_name.pluralize}", "#{view}.html.slim")
        end
      end

      def add_resource_route
        route "resources :#{file_name.pluralize}, :module => 'tandem'"
      end
    end
  end
end
