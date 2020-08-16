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
end
