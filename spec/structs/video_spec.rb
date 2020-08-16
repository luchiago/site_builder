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
end
