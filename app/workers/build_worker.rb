# frozen_string_literal: true

class BuildWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(site, params)
    widgets = CreateWidgetService.new(params).perform
    BuildService.new(widgets, site).build_html
  end
end
