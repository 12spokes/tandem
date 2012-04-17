module Tandem
  class Engine < Rails::Engine
    isolate_namespace Tandem
    
    config.generators do |g|
      g.test_framework :rspec, :fixture => true
      g.fixture_replacement :factory_girl, :dir => "spec/factories"
      g.template_engine :slim
    end

    config.eager_load_paths << File.expand_path("../../../app/models/tandem/content", __FILE__)

    initializer "tandem.include_page_helpers" do |app|
      ActiveSupport.on_load(:action_controller) do
        helper ::Tandem::PagesHelper
      end

      ActiveSupport.on_load(:action_view) do
        include ::Tandem::PagesHelper
      end
    end
  end
end
