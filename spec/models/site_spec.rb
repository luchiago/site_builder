# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Site, type: :model do
  describe 'relations' do
    it { is_expected.to have_many(:builds) }
    it { is_expected.to belong_to(:current_build).class_name('Build').optional }
  end

  describe '#current_build_html' do
    let(:html) { '<div>Test</div>' }
    let(:site) { described_class.create }
    let(:build) { Build.create(html_build: html, site: site) }

    context 'with a current build' do
      before { site.update(current_build: build) }

      it 'returns an html' do
        expect(site.current_build_html).to eq(html)
      end
    end

    context 'without a current build' do
      it 'returns nil' do
        expect(site.current_build_html).to be_nil
      end
    end
  end

  describe '#builds_ordered' do
    let(:html) { '<div>Test</div>' }
    let(:site) { described_class.create }
    let(:build) { Build.create(html_build: html, site: site) }
    let(:build2) { Build.create(html_build: html, site: site) }

    context 'with builds' do
      it 'returns list of builds' do
        expect(site.builds_ordered).to include(build, build2)
      end
    end

    context 'without builds' do
      it 'returns an empty list' do
        expect(site.builds_ordered).to be_empty
      end
    end
  end
end
