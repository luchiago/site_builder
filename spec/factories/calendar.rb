# frozen_string_literal: true

FactoryBot.define do
  factory :calendar, class: Hash do
    defaults = {
      title: Faker::Lorem.sentence,
      position: Random.rand(12)
    }

    initialize_with { defaults.merge(attributes) }
  end
end
