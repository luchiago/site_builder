# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TextContentCell, type: :cell do
  subject { cell(:text_content, object).call(:show) }

  let(:object) { TextContent.new(build(:text_content)) }

  it { is_expected.to include(object.title) }
  it { is_expected.to include(object.background_color) }
  it { is_expected.to include(object.content) }
  it { is_expected.to include(object.position.to_s) }
end
