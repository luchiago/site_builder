# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BuildService, type: :service do
  describe '#perform' do
    subject(:service) { described_class.new(widgets, site).build_html }

    let(:site) { Site.create }
    let(:basic_info) { BasicInfo.new(build(:basic_info)) }
    let(:text_content) { TextContent.new(build(:text_content)) }

    let(:widgets) { [basic_info, text_content] }

    context 'with the widgets' do
      it { is_expected.to be_instance_of(Build) }

      it 'creates a build' do
        expect do
          service
        end.to change(Build, :count).by(1)
      end

      it 'updates the current build' do
        expect do
          service
          site.reload
        end.to change(site, :current_build)
      end

      it 'add the created build to site' do
        build = service
        site.reload
        expect(site.current_build).to eq(build)
      end

      it 'add basic info html to build' do
        build = service
        expect(build.html_build).to include(basic_info.title)
      end

      it 'add text content html to build' do
        build = service
        expect(build.html_build).to include(text_content.title)
      end
    end
  end
end
