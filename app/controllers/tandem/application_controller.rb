module Tandem
  class ApplicationController < ActionController::Base
    include ApplicationControllerDevelopmentHack if defined? ApplicationControllerDevelopmentHack
    layout :layout_path

    check_authorization

    rescue_from CanCan::AccessDenied do |exception|
      redirect_to (Configuration::unauthoried_path || root_url) , :alert => exception.message
    end

    define_method :current_user, Configuration.current_user

    private

    def current_ability
      @current_ability ||= Tandem::Ability.new(current_user)
    end

    def layout_path(layout)
      layout ||= :default
      layout.to_s.blank? || layout.to_s[0] == '/' ? layout : [Configuration.layouts_dir,layout.to_s].compact.join('/')
    end
  end
end
