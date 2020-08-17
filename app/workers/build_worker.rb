# frozen_string_literal: true

class BuildWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(site_id, params)
    widgets = CreateWidgetService.new(params).perform
    BuildService.new(widgets, site_id).build_html
  end
end
