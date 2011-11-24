source "http://rubygems.org"

# Declare your gem's dependencies in tandem.gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec

# jquery-rails is used by the dummy application
gem "jquery-rails"

# the following gems are used by the engine, but for some reason must be explicitly required for the dummy to work
gem "rails", '~> 3.1.3'
gem 'pg'
gem 'slim'

# Declare any dependencies that are still in development here instead of in
# your gemspec. These might include edge Rails or gems from your path or
# Git. Remember to move these dependencies to your gemspec before releasing
# your gem to rubygems.org.

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

group :test, :development do
  #gem "rspec-rails"
  #gem "cucumber-rails"
  #gem 'factory_girl_rails', '>= 1.2.0'
  #gem "jasmine"
  #gem 'launchy'
  #gem 'capybara-webkit'
  #gem 'database_cleaner'
  #gem "spork"

  gem 'guard'
  gem 'guard-spork'
  gem 'guard-rspec'
  gem 'guard-cucumber'
  gem 'guard-livereload'
  gem 'growl_notify'

  gem 'rb-inotify', :require => false
  gem 'rb-fsevent', :require => false
  gem 'rb-fchange', :require => false
end