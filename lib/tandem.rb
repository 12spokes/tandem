require "tandem/engine"

module Tandem
  module Configuration
    def self.included(base)
      if base == Tandem::ApplicationController
        raise(ConfigurationNotFound.new("Tandem::Configuration.current_user { ... }")) unless @@current_user
        base.send :define_method, :current_user, @@current_user
      elsif base == Tandem::Ability
        raise(ConfigurationNotFound.new("Tandem::Configuration.user_abilities { |user| ... }")) unless @@user_abilities
        base.send :define_method, :initialize, @@user_abilities
      end
    end

    def self.current_user(&block)
      @@current_user = block
    end

    def self.user_abilities(&block)
      @@user_abilities = block
    end
  end

  class ConfigurationNotFound < StandardError
    attr_accessor :message
    def initialize(option)
      @message = "Tandem configuration option not found. " +
        "Please complete this in config/initializers/tandem.rb with this line:\n\n" +
        "#{option}"
    end
  end
end
