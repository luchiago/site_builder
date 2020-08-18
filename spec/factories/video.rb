# frozen_string_literal: true

FactoryBot.define do
  VIDEO_URLS = ['https://www.youtube.com/embed/Kj_dINCC-cY', 'https://player.vimeo.com/video/77924336'].freeze

  factory :video, class: Hash do
    defaults = {
      title: Faker::Lorem.sentence,
      url: VIDEO_URLS.sample,
      position: Random.rand(12)
    }

    initialize_with { defaults.merge(attributes) }
  end
end
