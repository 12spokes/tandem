require "tandem/engine"
require "cancan"
require "slim-rails"
require "paperclip"

module Tandem
  module Configuration
    mattr_accessor :unauthorized_path, :layouts_dir, :uploaded_images_dir, :uploaded_images_template

    self.unauthorized_path = nil
    self.layouts_dir = "tandem"
    self.uploaded_images_dir = ":rails_root/public"
    self.uploaded_images_template = "/assets/images/:id/:style/:basename.:extension"

    def self.current_user_proc(&block)
      @@current_user = block
    end

    def self.user_abilities_proc(&block)
      @@user_abilities = block
    end

    def self.current_user
      debugger
      raise(ConfigurationNotFound.new("Tandem::Configuration.current_user { ... }")) unless @@current_user
      @@current_user
    end

    def self.user_abilities
      raise(ConfigurationNotFound.new("Tandem::Configuration.user_abilities { |user| ... }")) unless @@user_abilities
      @@user_abilities
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
