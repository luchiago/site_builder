# frozen_string_literal: true

module SchemaErrorsHelper
  def error_message(param)
    @error_message ||= errors_hash[param].first
  end

  def errors_hash
    @errors_hash ||= validation.errors.to_h
  end
end
