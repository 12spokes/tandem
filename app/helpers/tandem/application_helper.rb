module Tandem
  module ApplicationHelper
    def self.included(base)
      main_app_url_helpers.each do |helper|
        base.send(:define_method, helper) do
          main_app.send(helper)
        end
      end
    end

    private
      def self.main_app_url_helpers
        ::Rails.application.routes.url_helpers.methods.select{|method| method.match(/^(?!hash\_for).*_(path|url)$/)}
      end
  end
end
