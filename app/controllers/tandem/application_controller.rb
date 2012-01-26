module Tandem
  class ApplicationController < ActionController::Base
    include ApplicationControllerDevelopmentHack if defined? ApplicationControllerDevelopmentHack
    check_authorization

    rescue_from CanCan::AccessDenied do |exception|
      redirect_to (Configuration::unauthorized_path || root_url) , :alert => exception.message
    end

    define_method :current_user, Configuration.current_user

    private

    def current_ability
      @current_ability ||= Tandem::Ability.new(current_user)
    end
  end
end
