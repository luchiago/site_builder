# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BasicInfo, type: :struct do
  describe 'with attributes' do
    subject do
      described_class.new(params)
    end

    let(:params) { build(:basic_info) }

    it { is_expected.to have_attributes(title: params[:title]) }
    it { is_expected.to have_attributes(icon: params[:icon]) }
    it { is_expected.to have_attributes(background_color: params[:background_color]) }
    it { is_expected.to have_attributes(banner_background_color: params[:banner_background_color]) }
  end

  describe '#render' do
    subject do
      described_class.new(params).render
    end

    let(:params) { build(:basic_info) }

    it { is_expected.to include(params[:icon]) }
    it { is_expected.to include(params[:title]) }
    it { is_expected.to include(params[:background_color]) }
    it { is_expected.to include(params[:banner_background_color]) }
    it { is_expected.to include('html') }
    it { is_expected.to include('body') }
    it { is_expected.to include('icon') }
    it { is_expected.to include('div') }
    it { is_expected.to include('id="banner"') }
    it { is_expected.to include('Banner Icon') }
  end
end
