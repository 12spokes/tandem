# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "tandem"
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Trey Bean, Jay Crouch, Ethan Vizitei"]
  s.date = "2011-11-18"
  s.description = "Generate a CMS infrastructure within an app"
  s.email = "trey@12spokes.com"
  s.extra_rdoc_files = ["CHANGELOG", "README.rdoc", "lib/tandem.rb", "lib/tandem/permissions.rb", "tasks/tandem_tasks.rake"]
  s.files = ["CHANGELOG", "MIT-LICENSE", "README.rdoc", "Rakefile", "app/controllers/tandem_contents_controller.rb", "app/controllers/tandem_pages_controller.rb", "app/controllers/tandem_texts_controller.rb", "app/helpers/tandem_contents_helper.rb", "app/helpers/tandem_pages_helper.rb", "app/helpers/tandem_texts_helper.rb", "app/models/tandem_content.rb", "app/models/tandem_page.rb", "app/models/tandem_text.rb", "app/views/tandem_contents/edit.html.erb", "app/views/tandem_contents/index.html.erb", "app/views/tandem_contents/new.html.erb", "app/views/tandem_contents/show.html.erb", "app/views/tandem_pages/edit.html.erb", "app/views/tandem_pages/index.html.erb", "app/views/tandem_pages/new.html.erb", "app/views/tandem_pages/show.html.erb", "app/views/tandem_texts/edit.html.erb", "app/views/tandem_texts/index.html.erb", "app/views/tandem_texts/new.html.erb", "app/views/tandem_texts/show.html.erb", "config/routes.rb", "db/migrate/20100305230233_create_tandem_pages.rb", "db/migrate/20100308034744_create_tandem_contents.rb", "db/migrate/20100308170914_create_tandem_texts.rb", "features/step_definitions/tandem_steps.rb", "features/support/env.rb", "features/tandem.feature", "init.rb", "install.rb", "lib/tandem.rb", "lib/tandem/permissions.rb", "spec/controllers/application_controller_spec.rb", "spec/controllers/tandem_contents_controller_spec.rb", "spec/controllers/tandem_pages_controller_spec.rb", "spec/controllers/tandem_texts_controller_spec.rb", "spec/fixtures/tandem_contents.yml", "spec/fixtures/tandem_pages.yml", "spec/fixtures/tandem_texts.yml", "spec/helpers/tandem_contents_helper_spec.rb", "spec/helpers/tandem_pages_helper_spec.rb", "spec/helpers/tandem_texts_helper_spec.rb", "spec/integration/tandem_contents_spec.rb", "spec/integration/tandem_pages_spec.rb", "spec/integration/tandem_texts_spec.rb", "spec/models/tandem_content_spec.rb", "spec/models/tandem_page_spec.rb", "spec/models/tandem_text_spec.rb", "spec/routing/tandem_contents_routing_spec.rb", "spec/routing/tandem_pages_routing_spec.rb", "spec/routing/tandem_texts_routing_spec.rb", "spec/spec.opts", "spec/spec_helper.rb", "spec/tandem_spec.rb", "spec/views/tandem_contents/edit.html.erb_spec.rb", "spec/views/tandem_contents/index.html.erb_spec.rb", "spec/views/tandem_contents/new.html.erb_spec.rb", "spec/views/tandem_contents/show.html.erb_spec.rb", "spec/views/tandem_pages/edit.html.erb_spec.rb", "spec/views/tandem_pages/index.html.erb_spec.rb", "spec/views/tandem_pages/new.html.erb_spec.rb", "spec/views/tandem_pages/show.html.erb_spec.rb", "spec/views/tandem_texts/edit.html.erb_spec.rb", "spec/views/tandem_texts/index.html.erb_spec.rb", "spec/views/tandem_texts/new.html.erb_spec.rb", "spec/views/tandem_texts/show.html.erb_spec.rb", "tasks/tandem_tasks.rake", "test/tandem_test.rb", "test/test_helper.rb", "uninstall.rb", "Manifest", "tandem.gemspec"]
  s.homepage = "https://github.com/12spokes/tandem"
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Tandem", "--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = "tandem"
  s.rubygems_version = "1.8.11"
  s.summary = "Generate a CMS infrastructure within an app"
  s.test_files = ["test/tandem_test.rb", "test/test_helper.rb"]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
