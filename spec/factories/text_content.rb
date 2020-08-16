# frozen_string_literal: true

FactoryBot.define do
  factory :text_content, class: Hash do
    defaults = {
      title: Faker::Lorem.sentence,
      background_color: "##{SecureRandom.hex(3)}",
      content: Faker::Lorem.paragraph,
      position: Random.rand(12)
    }

    initialize_with { defaults.merge(attributes) }
  end
end
