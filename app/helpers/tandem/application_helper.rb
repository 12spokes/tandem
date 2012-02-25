module Tandem
  module ApplicationHelper
    def self.included(base)
      main_app_url_helpers.each do |helper|
        base.send(:define_method, helper) do
          main_app.send(helper)
        end
      end
    end


    def render_eco_template(template, locals = {})
      @eco_templates ||= {}

      if @eco_templates[template].nil?
        template_file = File.read("#{Tandem::Engine.config.root}/app/assets/javascripts/tandem/#{template}.jst.eco")
        @eco_templates[template] = Eco.context_for(template_file)
      end

      @eco_templates[template].call("render", locals).html_safe
    end

    private
      def self.main_app_url_helpers
        ::Rails.application.routes.url_helpers.methods.select{|method| method.match(/^(?!hash\_for).*_(path|url)$/)}
      end
  end
end
