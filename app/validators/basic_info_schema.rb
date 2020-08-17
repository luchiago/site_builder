# frozen_string_literal: true

class BasicInfoSchema < Dry::Schema::Params
  HEX_REGEX = /#([a-f0-9]{3}){1,2}\b/i.freeze
  ICON_URL_REGEX = %r{https://static\.thenounproject\.com/svg/[\d+]*\.svg\?[\w+|=&~-]*}.freeze

  define do
    required(:title).filled(:string)
    required(:icon).value(format?: ICON_URL_REGEX)
    required(:background_color).value(format?: HEX_REGEX)
    required(:banner_background_color).value(format?: HEX_REGEX)
  end
end
