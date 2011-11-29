require 'rails/generators'

class TandemGenerator < Rails::Generators::Base
  desc "This generator creates an initializer file at config/initializers"

  def self.source_root
    @source_root ||= File.join(File.dirname(__FILE__), 'templates')
  end

  def create_initializer_file
     copy_file 'initializer.rb', 'config/initializers/tandem.rb'
   end
end