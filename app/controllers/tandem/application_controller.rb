module Tandem
  class ApplicationController < ActionController::Base
    check_authorization
    rescue_from CanCan::AccessDenied do |exception|
      redirect_to root_url, :alert => exception.message
    end

    def current_user
      raise(ConfigurationNotFound.new("Tandem::Ability.initialize",'<method>'))
    end

    def current_ability
      @current_ability ||= Tandem::Ability.new(current_user)
    end
  end
end
