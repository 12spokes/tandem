require "tandem/engine"

module Tandem

  module ApplicationControllerConfig
    def current_user
      raise(ConfigurationNotFound.new("Tandem::ApplicationControllerConfig#current_user",'<method>'))
    end
  end

  module AbilityConfig
    def initialize(user)
      raise(ConfigurationNotFound.new("Tandem::AbilityConfig#initialize(user)",'<method>'))
    end
  end

  class ConfigurationNotFound < StandardError
    attr_accessor :message
    def initialize(option,type = '<value>')
      @message = "Tandem configuration option #{option} not found. " +
        "Please set this in config/initializers/forem.rb with this line:\n\n" +
        "Tandem.#{option}= #{type}"
    end
  end
end
