require "tandem/engine"

module Tandem
   mattr_accessor :current_user, :can

  class << self
    def current_user(request, session)
      raise(ConfigurationNotFound.new("current_user",'<method>')) unless @@current_user
      @@current_user.call(request, session)
    end
    def can?(user, action, target)
      raise(ConfigurationNotFound.new("can?",'<method>')) unless @@can
      @@can.call(user, action, target)
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
