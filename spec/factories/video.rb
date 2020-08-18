# frozen_string_literal: true

FactoryBot.define do
  factory :video, class: Hash do
    defaults = {
      title: Faker::Lorem.sentence,
      url: ['https://www.youtube.com/embed/Kj_dINCC-cY',
            'https://player.vimeo.com/video/77924336'].sample,
      position: Random.rand(12)
    }

    initialize_with { defaults.merge(attributes) }
  end
end
