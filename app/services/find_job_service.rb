# frozen_string_literal: true

class FindJobService
  def initialize(job_id)
    Rails.logger.info 'Initializing Find Job Service'
    @job_hash = HashWithIndifferentAccess.new
    @job_id = job_id
    @data = Sidekiq::Status.get_all job_id
  end

  def perform
    return @job_hash if @data.empty?

    Rails.logger.info 'Setting the build status'
    set_message!
    add_site
    @job_hash
  end

  private

  def set_message!
    @job_hash[:message] = status_message
    Rails.logger.debug "Build status #{status_message}"
  end

  def add_site
    @job_hash[:site_id] = JSON.parse(@data['args']).first
    Rails.logger.debug "Site ID #{@job_hash[:site_id]}"
  end

  def status_message
    return 'queued' if Sidekiq::Status.queued?           @job_id
    return 'working' if Sidekiq::Status.working?         @job_id
    return 'retrying' if Sidekiq::Status.retrying?       @job_id
    return 'completed' if Sidekiq::Status.complete?      @job_id
    return 'failed' if Sidekiq::Status.failed?           @job_id
    return 'interrupted' if Sidekiq::Status.interrupted? @job_id
  end
end
