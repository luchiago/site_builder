# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Calendar, type: :struct do
  describe 'with attributes' do
    subject do
      described_class.new(params)
    end

    let(:params) { build(:calendar) }

    it { is_expected.to have_attributes(title: params[:title]) }
    it { is_expected.to have_attributes(position: params[:position]) }
  end
end
