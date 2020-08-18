# frozen_string_literal: true

module RequestHelpers
  def json
    @json ||= JSON.parse(response.body)
  end

  def to_json(resource)
    JSON.parse(resource.to_json)
  end
end
