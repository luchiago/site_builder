# frozen_string_literal: true

class VideoSchema < Dry::Schema::Params
  YOUTUBE_URL_REGEX = %r{^((?:https?:)?//)?((?:www|m)\.)?((?:youtube\.com|youtu.be))(/(?:[\w\-]+\?v=|embed/|v/)?)([\w\-]+)(\S+)?$}.freeze
  VIMEO_URL_REGEX = %r{(?:https?:)?://(www\.)?vimeo.com/(?:channels/(?:\w+/)?|groups/([^/]*)/videos/|)(\d+)(?:|/\?)}.freeze

  define do
    required(:title).filled(:string)
    required(:url).value(:string) { format?(YOUTUBE_URL_REGEX) | format?(VIMEO_URL_REGEX) }
    required(:position).filled(:integer)
  end
end
