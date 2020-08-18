# frozen_string_literal: true

module Api
  module V1
    class JobsController < ApplicationController
      before_action :find_job

      def status
        render_resource(payload)
      end

      private

      def find_job
        @job_hash = FindJobService.new(params[:jid]).perform
        not_found_resource if @job_hash.empty?
      end

      def payload
        {
          message: @job_hash[:message],
          site_id: @job_hash[:site_id]
        }
      end
    end
  end
end
