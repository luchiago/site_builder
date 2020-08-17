# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CreateWidgetService, type: :service do
  describe '#perform' do
    subject(:service) { described_class.new(params).perform }

    let(:site_params) do
      {
        basic_info: build(:basic_info),
        text_content: [build(:text_content)],
        video: [build(:video)],
        calendar: build(:calendar),
        weather: build(:weather)
      }
    end

    context 'with the site params' do
      let(:params) { site_params }

      it 'returns an array of widgets' do
        expect(service).not_to be_empty
      end

      it 'returns the basic info in the beginning of the array' do
        expect(service.first).to be_instance_of(BasicInfo)
      end

      it 'returns the widgets ordered' do
        service.shift
        widgets_positions = service.map(&:position)
        expect(widgets_positions).to eq(widgets_positions.sort)
      end
    end
  end
end
