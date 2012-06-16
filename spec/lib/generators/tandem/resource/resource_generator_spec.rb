require 'spec_helper'
require "#{ENGINE_RAILS_ROOT}/lib/generators/tandem/resource/resource_generator.rb"
require "generator_spec/test_case"

module Tandem
  module Generators
    describe ResourceGenerator do
      include GeneratorSpec::TestCase

      destination File.expand_path("#{ENGINE_RAILS_ROOT}/spec/dummy/tmp", __FILE__)
      arguments %w(spoke name:string color:string)

      before(:all) do
        prepare_destination
        
        mkdir_p("#{destination_root}/config")
        FileUtils.cp "#{ENGINE_RAILS_ROOT}/config/routes.rb", "#{destination_root}/config/routes.rb"

        run_generator
      end

      specify do
        destination_root.should have_structure {
          directory 'app' do
            directory 'controllers' do
              directory 'tandem' do
                file 'spokes_controller.rb' do
                  contains 'module Tandem'
                  contains 'class SpokesController < ::Tandem::ResourceController'
                end
              end
            end

            directory 'views' do
              directory 'tandem' do
                directory 'spokes' do
                  file 'index.html.slim' do
                    contains 'Spokes:'
                  end

                  file 'show.html.slim'
                  file 'new.html.slim'
                  file 'edit.html.slim'
                  file '_form.html.slim'
                end
              end
            end
          end

          directory 'config' do
            file 'routes.rb' do
              contains "resources :spokes, :module => 'tandem'"
            end
          end
        }
      end
    end
  end
end