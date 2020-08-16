# frozen_string_literal: true

FactoryBot.define do
  factory :weather, class: Hash do
    defaults = {
      location: Faker::Address.city,
      position: Random.rand(12)
    }
    initialize_with { defaults.merge(attributes) }
  end
end
