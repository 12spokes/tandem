require File.expand_path('../../../../../lib/generators/templates/initializer.rb', __FILE__)

module Tandem
  module ApplicationControllerDevelopmentHack
    def self.included(base)
      base.append_view_path(File.expand_path('../../lib/generators/templates'))
    end
  end
end


