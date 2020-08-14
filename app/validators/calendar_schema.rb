# frozen_string_literal: true

class CalendarSchema < Dry::Schema::Params
  define do
    required(:title).filled(:string)
    required(:position).filled(:integer)
  end
end
