# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CalendarCell, type: :cell do
  subject { cell(:calendar, object).call(:show) }

  let(:object) { Calendar.new(build(:calendar)) }

  it { is_expected.to include(object.title) }
  it { is_expected.to include(object.position.to_s) }
end
