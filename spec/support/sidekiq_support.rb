require 'sidekiq/testing'

Sidekiq.logger.level = Logger::ERROR

RSpec::Sidekiq.configure do |config|
  config.warn_when_jobs_not_processed_by_sidekiq = false
end
