# frozen_string_literal: true

require 'rails_helper'

RSpec.describe VideoSchema, type: :validator do
  describe 'validates video widget' do
    subject(:validation) { described_class.new.call(params) }

    context 'with valid params' do
      let(:params) { build(:video) }

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
      let(:params) { build(:video, title: nil) }

      it 'returns unsuccessful status' do
        expect(validation).not_to be_success
      end

      it 'returns error message' do
        expect(error_message(:title)).to eq('must be filled')
      end
    end

    context 'with url video param invalid' do
      let(:params) { build(:video, url: 'https://youtube.com/watch?v=DFYRQ_zQ-gk') }

      it 'returns unsuccessful status' do
        expect(validation).not_to be_success
      end

      it 'returns error message' do
        expect(error_message(:url)).to eq('is in invalid format or is in invalid format')
      end
    end

    context 'with position param invalid' do
      let(:params) { build(:video, position: nil) }

      it 'returns unsuccessful status' do
        expect(validation).not_to be_success
      end

      it 'returns error message' do
        expect(error_message(:position)).to eq('must be filled')
      end
    end
  end
end
