module Tandem
  class ApplicationController < ActionController::Base
    check_authorization
    rescue_from CanCan::AccessDenied do |exception|
      redirect_to root_url, :alert => exception.message
    end

    def current_user
      Tandem::current_user(request,session)
    end

    def current_ability
      @current_ability ||= Tandem::Ability.new(current_user)
    end
  end
end
