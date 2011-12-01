require 'rails/generators'

class TandemGenerator < Rails::Generators::Base
  desc "This generator creates an initializer file at config/initializers"

  def self.source_root
    @source_root ||= File.join(File.dirname(__FILE__), 'templates')
  end

  def create_initializer_file
    initializer 'tandem.rb', File.open('initializer.rb.tt', 'rb') { |f| f.read }
  end

  def create_views_dir
    directory 'layouts', 'app/views/layouts/tandem'
  end
end