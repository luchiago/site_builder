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

  describe '#render' do
    subject do
      described_class.new(params).render
    end

    let(:params) { build(:weather) }

    it { is_expected.to include(params[:location]) }
    it { is_expected.to include(params[:position].to_s) }
    it { is_expected.to include('div') }
    it { is_expected.to include('id') }
    it { is_expected.to include('h2') }
  end
end
