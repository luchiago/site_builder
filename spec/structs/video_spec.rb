# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Video, type: :struct do
  describe 'with attributes' do
    subject do
      described_class.new(params)
    end

    let(:params) { build(:video) }

    it { is_expected.to have_attributes(title: params[:title]) }
    it { is_expected.to have_attributes(url: params[:url]) }
    it { is_expected.to have_attributes(position: params[:position]) }
  end

  describe '#render' do
    subject do
      described_class.new(params).render
    end

    let(:params) { build(:video) }

    it { is_expected.to include(params[:title]) }
    it { is_expected.to include(params[:url]) }
    it { is_expected.to include(params[:position].to_s) }
    it { is_expected.to include('div') }
    it { is_expected.to include('id') }
    it { is_expected.to include('h2') }
    it { is_expected.to include('iframe') }
  end
end
