module Tandem
  class ApplicationController < ActionController::Base
    include ApplicationControllerDevelopmentHack if defined? ApplicationControllerDevelopmentHack
    layout :layout_path

    check_authorization

    rescue_from CanCan::AccessDenied do |exception|
      redirect_to (Configuration::unauthorized_path || root_url) , :alert => exception.message
    end

    define_method :current_user, Configuration.current_user

    private

    def current_ability
      @current_ability ||= Tandem::Ability.new(current_user)
    end

    def layout_path(layout)
      return layout if layout.to_s.blank?
      return layout.to_s[1..-1] if layout.to_s[0] == '/'
      [Configuration.layouts_dir,layout.to_s].compact.join('/')
    end

    def javascript_layout
      layout_path :javascript
    end
  end
end
