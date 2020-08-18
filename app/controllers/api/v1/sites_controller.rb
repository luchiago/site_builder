# frozen_string_literal: true

module Api
  module V1
    class SitesController < ApplicationController
      include ActionController::MimeResponds

      before_action :validate_widgets, only: %i[update create]
      before_action :find_site, only: %i[update show build]

      def build
        render_resource(@site.builds_ordered)
      end

      def create
        build_site
      end

      def update
        build_site(@site)
      end

      def show
        if stale?(@site)
          respond_to do |format|
            format.html { render html: @site.current_build_html, status: :ok }
            format.json { render json: { code: @site.current_build_html }, status: :ok }
          end
        end
      end

      private

      def site_params
        params.require(:site).permit!.to_h
      end

      def find_site
        @site = Site.find_by(id: params[:id])
        not_found_resource if @site.nil?
      end

      def build_site(site = Site.create)
        if @validation.success?
          enqueue_worker(site)
        else
          render_errors({ errors: @validation.errors.to_h }, :unprocessable_entity)
        end
      end

      def validate_widgets
        json_validator = SiteParams.new
        @validation = json_validator.call(site_params)
      end

      def enqueue_worker(site)
        jid = BuildWorker.perform_async(site.id, site_params)
        render_resource({ site_id: site.id, jid: jid }, :accepted)
      end
    end
  end
end
