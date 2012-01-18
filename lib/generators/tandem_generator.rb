require 'rails/generators'

class TandemGenerator < Rails::Generators::Base
  desc "This generator creates an initializer file at config/initializers"

  def self.source_root
    @source_root ||= File.join(File.dirname(__FILE__), 'templates')
  end

  def create_initializer_file
    initializer 'tandem.rb', File.open(File.join(self.class.source_root,'initializer.rb'), 'rb') { |f| f.read }
  end

  def create_views_dir
    directory 'layouts', 'app/views/layouts'
  end

  def add_mounting_route
    route('mount Tandem::Engine => "/tandem"')
  end

  def import_migrations
    rake("tandem:install:migrations")
  end

  def add_gem_dependencies
    #gem 'tandem', path: '/Library/WebServer/12spokes/tandem'
    gem 'slim'
    gem 'cancan'
    gem 'paperclip'
  end
end