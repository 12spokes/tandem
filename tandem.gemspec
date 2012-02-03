$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "tandem/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "tandem"
  s.version     = Tandem::VERSION
  s.authors     = ["Jay Crouch, Trey Bean"]
  s.email       = ["trey@12spokes.com"]
  s.homepage    = "http://www.12spokes.com"
  s.summary     = "Embed a customizable CMS within an app."
  s.description = "Embed a customizable CMS within an app."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", ">= 3.1.0"
  s.add_dependency "cancan"
  s.add_dependency "slim-rails"
  s.add_dependency "paperclip"

  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "cucumber-rails"
  s.add_development_dependency 'factory_girl_rails', '>= 1.2.0'
  s.add_development_dependency "jasmine"
  s.add_development_dependency 'launchy'
  s.add_development_dependency 'capybara-webkit'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'spork'
  s.add_development_dependency 'ruby-debug19'
end
