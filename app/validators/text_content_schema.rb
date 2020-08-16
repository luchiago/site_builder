# frozen_string_literal: true

class TextContentSchema < Dry::Schema::Params
  HEX_REGEX = /#([a-f0-9]{3}){1,2}\b/i.freeze

  define do
    required(:title).filled(:string)
    required(:background_color).value(format?: HEX_REGEX)
    required(:content).filled(:string)
    required(:position).filled(:integer)
  end
end
