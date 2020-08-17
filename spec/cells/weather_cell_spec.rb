# frozen_string_literal: true

require 'rails_helper'

RSpec.describe WeatherCell, type: :cell do
  subject { cell(:weather, object).call(:show) }

  let(:object) { Weather.new(build(:weather)) }

  it { is_expected.to include(object.location) }
  it { is_expected.to include(object.position.to_s) }
end
