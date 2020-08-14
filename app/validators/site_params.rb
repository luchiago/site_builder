# frozen_string_literal: true

class SiteParams < Dry::Schema::Params
  MIN_SIZE = 1
  MAX_SIZE_VIDEO = 2
  MAX_SIZE_TEXT_CONTENT = 10

  define do
    required(:basic_info).hash(BasicInfoSchema.new)
    optional(:text_content).value(:array, min_size?: MIN_SIZE, max_size?: MAX_SIZE_TEXT_CONTENT).each do
      hash(TextContentSchema.new)
    end
    optional(:video).value(:array, min_size?: MIN_SIZE, max_size?: MAX_SIZE_VIDEO).each do
      hash(VideoSchema.new)
    end
    optional(:calendar).hash(CalendarSchema.new)
    optional(:weather).hash(WeatherSchema.new)
  end
end
