require "tandem/engine"

module Tandem
  mattr_accessor :current_user, :initialize_abilities

  class << self
    def current_user(session, request)
      raise(ConfigurationNotFound.new("current_user",'<method>')) unless @@current_user
      @@current_user.call(session, request)
    end

    def initialize_abilities(user)
      raise(ConfigurationNotFound.new("initialize_abilities",'<method>')) unless @@initialize_abilities
      @@initialize_abilities.call(user)
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
