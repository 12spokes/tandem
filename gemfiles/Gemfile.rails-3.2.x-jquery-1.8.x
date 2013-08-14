source "https://rubygems.org"

# Declare your gem's dependencies in tandem.gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec :path => '..'

gem "rails", "~> 3.2.14"

gem 'pg'

gem "jquery-rails", '2.1.4'
gem "devise"
gem 'slim'
gem 'cancan', '1.6.7'
gem 'paperclip'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end


# Declare any dependencies that are still in development here instead of in
# your gemspec. These might include edge Rails or gems from your path or
# Git. Remember to move these dependencies to your gemspec before releasing
# your gem to rubygems.org.

group :test, :development do
  gem 'rspec-rails', '~> 2.0'
  gem 'capybara-webkit'
  gem 'database_cleaner'
  gem 'pry'
end

group :test do
  gem 'ammeter'
  gem 'factory_girl_rails'
  gem 'spork'
end
