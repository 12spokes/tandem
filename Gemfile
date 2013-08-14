source "http://rubygems.org"

# Declare your gem's dependencies in tandem.gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec

gem "rails", "~> 4.0"

gem 'pg'

gem "devise"
gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 1.2'
gem 'slim'
gem 'cancan', '1.6.7'
gem 'paperclip'

# Declare any dependencies that are still in development here instead of in
# your gemspec. These might include edge Rails or gems from your path or
# Git. Remember to move these dependencies to your gemspec before releasing
# your gem to rubygems.org.

group :test, :development do
  gem 'rspec-rails', '~> 2.0'
  gem 'capybara-webkit'
  gem 'database_cleaner'
end

group :test do
  gem 'ammeter'
  gem 'factory_girl_rails'
  gem 'spork'
end
