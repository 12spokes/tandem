require 'rails/generators'
require 'rails/generators/resource_helpers'

module Tandem
	module Generators
		class ResourceGenerator < ::Rails::Generators::NamedBase
		  include ::Rails::Generators::ResourceHelpers
		  
		  desc "Create a tandem resource"

		  source_root File.expand_path('../templates', __FILE__)

		  def create_tandem_resource_controller
		    template 'controller.rb', File.join('app/controllers/tandem', "#{controller_file_name}_controller.rb")
		  end
		end
  end
end
