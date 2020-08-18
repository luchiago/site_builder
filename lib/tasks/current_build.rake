# frozen_string_literal: true

namespace :current_build do
  task :change, %i[site_id build_id] => :environment do |_task, args|
    Rails.logger.info 'Changing html build'
    site = Site.find_by(id: args.site_id)
    build = Build.find_by(id: args.build_id)
    if site && build
      Rails.logger.info "Updating #{site} with #{build}"
      site.update(current_build: build)
    else
      Rails.logger.error 'One resource was not found'
      Rails.logger.info 'Site not found' unless site
      Rails.logger.info 'Build not found' unless build
    end
  end
end
