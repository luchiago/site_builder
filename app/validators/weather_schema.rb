# frozen_string_literal: true

class WeatherSchema < Dry::Schema::Params
  define do
    required(:location).filled(:string)
    required(:position).filled(:integer)
  end
end
