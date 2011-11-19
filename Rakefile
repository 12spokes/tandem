require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "tandem"
  gem.homepage = "https://github.com/12spokes/tandem"
  gem.license = "MIT"
  gem.summary = %Q{An integrated CMS infrastructure within an app}
  gem.description = %Q{An integrated CMS infrastructure within an app}
  gem.email = "trey@12spokes.com"
  gem.authors = %w(Trey Bean Jay Crouch Ethan Vizitei)
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:core) do |spec|
  spec.pattern = 'spec/erector/*_spec.rb'
  spec.rspec_opts = ['--backtrace']
end

task :default => :spec

require 'rcov/rcovtask'
Rcov::RcovTask.new do |test|
  test.libs << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
  test.rcov_opts << '--exclude "gems/*"'
end

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "tandem #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
