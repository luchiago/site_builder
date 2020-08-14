# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SiteParams, type: :validator do
  describe 'validates the site params' do
    subject(:validation) { described_class.new.call(params) }

    let(:valid_params) do
      {
        basic_info: build(:basic_info),
        text_content: [build(:text_content)],
        video: [build(:video)],
        calendar: build(:calendar),
        weather: build(:weather)
      }
    end

    context 'with valid params' do
      let(:params) { valid_params }

      it 'returns success status' do
        expect(validation).to be_success
      end
    end

    context 'with only basic info' do
      let(:params) { { basic_info: build(:basic_info) } }

      it 'returns success status' do
        expect(validation).to be_success
      end
    end

    context 'without basic info' do
      let(:params) { { video: build(:video) } }

      it 'returns unsuccessful status' do
        expect(validation).not_to be_success
      end

      it 'returns errors messages' do
        expect(error_message(:basic_info)).to eq('is missing')
      end
    end

    context 'without any widgets' do
      let(:params) { {} }

      it 'returns unsuccessful status' do
        expect(validation).not_to be_success
      end

      it 'returns errors messages' do
        expect(errors_hash).not_to be_empty
      end
    end

    context 'with less than one text content' do
      let(:params) { valid_params.merge(text_content: []) }

      it 'returns unsuccessful status' do
        expect(validation).not_to be_success
      end

      it 'returns errors messages' do
        expect(error_message(:text_content)).to eq('size cannot be less than 1')
      end
    end

    context 'with more than ten text contents' do
      let(:params) { valid_params.merge(text_content: build_list(:text_content, 11)) }

      it 'returns unsuccessful status' do
        expect(validation).not_to be_success
      end

      it 'returns errors messages' do
        expect(error_message(:text_content)).to eq('size cannot be greater than 10')
      end
    end

    context 'with less than one video content' do
      let(:params) { valid_params.merge(video: []) }

      it 'returns unsuccessful status' do
        expect(validation).not_to be_success
      end

      it 'returns errors messages' do
        expect(error_message(:video)).to eq('size cannot be less than 1')
      end
    end

    context 'with more than two videos' do
      let(:params) { valid_params.merge(video: build_list(:video, 3)) }

      it 'returns unsuccessful status' do
        expect(validation).not_to be_success
      end

      it 'returns errors messages' do
        expect(error_message(:video)).to eq('size cannot be greater than 2')
      end
    end

    context 'with more than one calendar' do
      let(:params) { valid_params.merge(calendar: build_list(:calendar, 2)) }

      it 'returns unsuccessful status' do
        expect(validation).not_to be_success
      end

      it 'returns errors messages' do
        expect(error_message(:calendar)).to eq('must be a hash')
      end
    end

    context 'with more than one weather' do
      let(:params) { valid_params.merge(weather: build_list(:weather, 2)) }

      it 'returns unsuccessful status' do
        expect(validation).not_to be_success
      end

      it 'returns errors messages' do
        expect(error_message(:weather)).to eq('must be a hash')
      end
    end
  end
end
