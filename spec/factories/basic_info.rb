# frozen_string_literal: true

FactoryBot.define do
  factory :basic_info, class: Hash do
    defaults = {
      title: Faker::Lorem.sentence,
      icon: "https://static.thenounproject.com/svg/#{Random.rand(100)}.svg?Expires=#{Random.rand(999)}",
      background_color: "##{SecureRandom.hex(3)}",
      banner_background_color: "##{SecureRandom.hex(3)}"
    }

    initialize_with { defaults.merge(attributes) }
  end
end
