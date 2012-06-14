require 'spec_helper'
require "#{ENGINE_RAILS_ROOT}/lib/generators/tandem/resources/resource_generator.rb"
require "generator_spec/test_case"

module Tandem
  module Generators
    describe ResourceGenerator do
      include GeneratorSpec::TestCase
      destination File.expand_path("../../../../../dummy/tmp", __FILE__)
      arguments %w(spoke name:string color:string)

      before(:all) do
        prepare_destination
        run_generator
      end

      specify do
        destination_root.should have_structure {
          directory 'app' do
            directory 'controllers' do
              directory 'tandem' do
                file 'spokes_controller.rb' do
                  contains 'class SpokesController < ::Tandem::ResourceController'
                end
              end
            end
          end
        }
      end
    end
  end
end