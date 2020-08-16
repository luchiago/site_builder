# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CalendarSchema, type: :validator do
  describe 'validates calendar widget' do
    subject(:validation) { described_class.new.call(params) }

    context 'with valid params' do
      let(:params) { build(:calendar) }

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
      let(:params) { build(:calendar, title: nil) }

      it 'returns unsuccessful status' do
        expect(validation).not_to be_success
      end

      it 'returns error message' do
        expect(error_message(:title)).to eq('must be filled')
      end
    end

    context 'with position param invalid' do
      let(:params) { build(:calendar, position: nil) }

      it 'returns unsuccessful status' do
        expect(validation).not_to be_success
      end

      it 'returns error message' do
        expect(error_message(:position)).to eq('must be filled')
      end
    end
  end
end
