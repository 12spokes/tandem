require 'rails/generators'

class TandemGenerator < Rails::Generators::Base
  desc "This generator sets up tandem."

  def self.source_root
    @source_root ||= File.join(File.dirname(__FILE__), 'templates')
  end

  def create_initializer_file
    initializer 'tandem.rb', File.open(File.join(self.class.source_root,'initializer.rb'), 'rb') { |f| f.read }
  end

  def add_mounting_route
    route('mount Tandem::Engine => "/"')
  end

  def import_migrations
    rake("tandem:install:migrations")
  end

  def inject_tandem_assets
    append_to_file 'app/assets/javascripts/application.js', '//= require tandem'
    insert_into_file 'app/assets/stylesheets/application.css', " *= require tandem\n", :before => /^\*\/$/
  end
end
