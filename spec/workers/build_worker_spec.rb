# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BuildWorker, type: :worker do
  describe '#perform' do
    let(:worker) { subject }
    let(:site) { Site.new }
    let(:create_widgets) { CreateWidgetService.new(params) }
    let(:build_service) { BuildService.new(widgets, site) }
    let(:basic_info) { FactoryBot.build(:basic_info) }
    let(:text_content) { FactoryBot.build(:text_content) }
    let(:params) { { basic_info: basic_info, text_content: [text_content] } }
    let(:widgets) { [BasicInfo.new(basic_info), TextContent.new(text_content)] }

    context 'with site params and a site' do
      before do
        allow(CreateWidgetService).to receive(:new).and_return(create_widgets)
        allow(create_widgets).to receive(:perform).and_return(widgets)
        allow(BuildService).to receive(:new).and_return(build_service)
        allow(build_service).to receive(:build_html)
        worker.perform(site, params)
      end

      it 'uses site params to create widgets' do
        expect(CreateWidgetService).to have_received(:new).with(params)
      end

      it 'creates widgets' do
        expect(create_widgets).to have_received(:perform)
      end

      it 'uses widgets to build the template' do
        expect(BuildService).to have_received(:new).with(widgets, site)
      end

      it 'build the template' do
        expect(build_service).to have_received(:build_html)
      end
    end

    context 'when the worker is enqueued' do
      it { is_expected.to be_processed_in :default }
      it { is_expected.to be_retryable false }
    end
  end
end
