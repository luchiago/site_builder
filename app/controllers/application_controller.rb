# frozen_string_literal: true

class ApplicationController < ActionController::API
  def render_resource(payload, status = :ok)
    render_json(payload, status)
  end

  def not_found_resource(payload = { errors: 'Not Found' }, status = :not_found)
    render_json(payload, status)
  end

  def render_errors(payload, status = :bad_request)
    render_json(payload, status)
  end

  private

  def render_json(payload = {}, status = :ok)
    render json: payload, status: status
  end
end
