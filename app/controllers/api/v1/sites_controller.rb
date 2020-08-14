# frozen_string_literal: true

module Api
  module V1
    class SitesController < ApplicationController
      before_action :validate_widgets, only: :create

      def create
        if @validation.success?
          render status: :created
        else
          render json: {
            errors: @validation.errors.to_h
          }, status: :bad_request
        end
      end

      private

      def site_params
        params.require(:site).permit!
      end

      def validate_widgets
        json_validator = SiteParams.new
        @validation = json_validator.call(site_params.to_h)
      end
    end
  end
end
