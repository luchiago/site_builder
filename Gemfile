# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.3', '>= 6.0.3.2'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 4.1'
# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false
# Json Schema validation
gem 'dry-schema', '~> 1.5', '>= 1.5.2'
# Views
gem 'cells-erb', '~> 0.1.0'
gem 'cells-rails', '~> 0.1.3'
gem 'trailblazer-cells', '~> 0.0.3'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  # Load environment variables from .env file
  gem 'dotenv-rails', '~> 2.7', '>= 2.7.6'
  # RSpec progress formater
  gem 'fuubar', '~> 2.5'
  # Creating fakes objets and seed the database
  gem 'factory_bot_rails', '~> 6.1'
  gem 'faker', '~> 2.13'
  # Pry to debug the application
  gem 'pry', '~> 0.13.1'
  gem 'pry-byebug', '~> 3.9'
end

group :development do
  gem 'listen', '~> 3.2'
  # Rubocop linter
  gem 'rubocop', '~> 0.88.0'
  gem 'rubocop-performance', '~> 1.7', '>= 1.7.1'
  gem 'rubocop-rails', '~> 2.7', '>= 2.7.1'
  gem 'rubocop-rspec', '~> 1.42'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  # RSpec for testing purposes
  gem 'rspec-rails', '~> 4.0', '>= 4.0.1'
  # Simplecov for coverage
  gem 'simplecov', '~> 0.18.5'
  # Matchers
  gem 'shoulda-matchers', '~> 4.3'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
