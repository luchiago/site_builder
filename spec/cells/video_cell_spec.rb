# frozen_string_literal: true

require 'rails_helper'

RSpec.describe VideoCell, type: :cell do
  subject { cell(:video, object).call(:show) }

  let(:object) { Video.new(build(:video)) }

  it { is_expected.to include(object.title) }
  it { is_expected.to include(object.url) }
  it { is_expected.to include(object.position.to_s) }
end
