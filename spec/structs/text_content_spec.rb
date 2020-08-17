# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TextContent, type: :struct do
  describe 'with attributes' do
    subject do
      described_class.new(params)
    end

    let(:params) { build(:text_content) }

    it { is_expected.to have_attributes(title: params[:title]) }
    it { is_expected.to have_attributes(background_color: params[:background_color]) }
    it { is_expected.to have_attributes(content: params[:content]) }
    it { is_expected.to have_attributes(position: params[:position]) }
  end

  describe '#render' do
    subject do
      described_class.new(params).render
    end

    let(:params) { build(:text_content) }

    it { is_expected.to include(params[:title]) }
    it { is_expected.to include(params[:background_color]) }
    it { is_expected.to include(params[:position].to_s) }
    it { is_expected.to include(params[:content]) }
    it { is_expected.to include('div') }
    it { is_expected.to include('id') }
    it { is_expected.to include('h2') }
    it { is_expected.to include('style') }
    it { is_expected.to include('h3') }
  end
end
