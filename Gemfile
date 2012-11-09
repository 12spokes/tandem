source "http://rubygems.org"

# Declare your gem's dependencies in tandem.gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec

# jquery-rails is used by the dummy application
gem "jquery-rails"
gem "devise"

# the following gems are used by the engine, but for some reason must be explicitly required for the dummy to work
gem 'pg'
gem 'slim'
gem 'cancan', '1.6.7'
gem 'paperclip'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer'

  gem 'uglifier', '>= 1.0.3'
end


# Declare any dependencies that are still in development here instead of in
# your gemspec. These might include edge Rails or gems from your path or
# Git. Remember to move these dependencies to your gemspec before releasing
# your gem to rubygems.org.

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

group :development do
  gem 'guard'
  gem 'guard-spork'
  gem 'guard-rspec'
  gem 'guard-livereload'
  gem 'ammeter'
  gem 'growl_notify' if RUBY_PLATFORM.include?('darwin')

  gem 'rb-inotify', :require => false
  gem 'rb-fsevent', :require => false
  gem 'rb-fchange', :require => false
end

group :test, :development do
  gem 'capybara-webkit'
  gem 'database_cleaner'
  gem 'pry'
end
