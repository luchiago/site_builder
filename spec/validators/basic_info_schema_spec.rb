# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BasicInfoSchema, type: :validator do
  describe 'validates basic info' do
    subject(:validation) { described_class.new.call(params) }

    context 'with valid params' do
      let(:params) { build(:basic_info) }

      it 'returns successful status' do
        expect(validation).to be_success
      end
    end

    context 'without params' do
      let(:params) { {} }

      it 'returns unsuccessful status' do
        expect(validation).not_to be_success
      end

      it 'returns errors messages' do
        expect(errors_hash).not_to be_empty
      end
    end

    context 'with title param invalid' do
      let(:params) { build(:basic_info, title: nil) }

      it 'returns unsuccessful status' do
        expect(validation).not_to be_success
      end

      it 'returns error message' do
        expect(error_message(:title)).to eq('must be filled')
      end
    end

    context 'with icon param invalid' do
      let(:params) { build(:basic_info, icon: 'http://anotherurl.com') }

      it 'returns unsuccessful status' do
        expect(validation).not_to be_success
      end

      it 'returns error message' do
        expect(error_message(:icon)).to eq('is in invalid format')
      end
    end

    context 'with background_color param invalid' do
      let(:params) { build(:basic_info, background_color: '#f00000aa') }

      it 'returns unsuccessful status' do
        expect(validation).not_to be_success
      end

      it 'returns error message' do
        expect(error_message(:background_color)).to eq('is in invalid format')
      end
    end

    context 'with banner background color param invalid' do
      let(:params) { build(:basic_info, banner_background_color: '#f00000aa') }

      it 'returns unsuccessful status' do
        expect(validation).not_to be_success
      end

      it 'returns error message' do
        expect(error_message(:banner_background_color)).to eq('is in invalid format')
      end
    end
  end
end
