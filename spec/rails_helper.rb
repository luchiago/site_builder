# frozen_string_literal: true

# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
require 'simplecov'

ENV['RAILS_ENV'] ||= 'test'

SimpleCov.start 'rails' do
  add_group 'Controllers', 'app/controllers'
  add_group 'Helpers', 'app/helpers'
  add_group 'Jobs', 'app/jobs'
  add_group 'Models', 'app/models'
  add_group 'Services', 'app/services'

  # Unchanged files/directories
  # Remove the filter if any of them are used and changed
  add_filter 'app/channels/'
  add_filter 'app/jobs/'
  add_filter 'app/helpers/'
  add_filter 'app/lib/'
  add_filter 'app/mailers'
end

require File.expand_path('../config/environment', __dir__)

abort('The Rails environment is running in production mode!') if Rails.env.production?
require 'rspec/rails'

Dir[Rails.root.join('spec/support/**/*.rb')].sort.each { |f| require f }

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
end
