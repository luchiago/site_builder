# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Weather, type: :struct do
  describe 'with attributes' do
    subject do
      described_class.new(params)
    end

    let(:params) { build(:weather) }

    it { is_expected.to have_attributes(location: params[:location]) }
    it { is_expected.to have_attributes(position: params[:position]) }
  end
end
