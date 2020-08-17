# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BasicInfoCell, type: :cell do
  subject { cell(:basic_info, object).call(:show) }

  let(:object) { BasicInfo.new(build(:basic_info)) }

  it { is_expected.to include(object.title) }
  it { is_expected.to include(object.background_color) }
  it { is_expected.to include(object.banner_background_color) }
  it { is_expected.to include(object.icon) }
end
