# frozen_string_literal: true

class BuildWorker
  include Sidekiq::Worker
  include Sidekiq::Status::Worker
  sidekiq_options retry: false

  def perform(site_id, params)
    Rails.logger.info "Perfoming Job for Site #{site_id} with #{params}"
    widgets = CreateWidgetService.new(params).perform
    BuildService.new(widgets, site_id).build_html
  end
end
