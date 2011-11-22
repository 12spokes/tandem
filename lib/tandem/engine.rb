module Tandem
  class Engine < Rails::Engine
    isolate_namespace Tandem
    config.generators do |g|
      g.test_framework :rspec, :fixture => true
      g.fixture_replacement :factory_girl, :dir => "spec/factories"
      g.template_engine :slim
    end
  end
end
