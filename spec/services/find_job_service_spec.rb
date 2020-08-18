# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FindJobService, type: :service do
  describe '#perform' do
    subject(:service) { described_class.new(job_id).perform }

    let(:job_id) { Faker::Internet.uuid }
    let(:site_id) { Faker::Internet.uuid }
    let(:data) do
      HashWithIndifferentAccess.new(
        { 'args': [site_id, { context: 'context' }].to_json }
      )
    end

    context 'with an inexistent job' do
      before do
        allow(Sidekiq::Status).to receive(:get_all).and_return(nil)
      end

      it { is_expected.to be_empty }
    end

    context 'with a queued job' do
      before do
        allow(Sidekiq::Status).to receive(:get_all).with(job_id).and_return(data)
        allow(Sidekiq::Status).to receive(:queued?).and_return(true)
      end

      it 'returns a hash with site id' do
        expect(service.dig('site_id')).to eq(site_id)
      end

      it 'returns a hash with job status' do
        expect(service.dig('message')).to eq('queued')
      end
    end

    context 'with a working job' do
      before do
        allow(Sidekiq::Status).to receive(:get_all).with(job_id).and_return(data)
        allow(Sidekiq::Status).to receive(:working?).and_return(true)
      end

      it 'returns a hash with site id' do
        expect(service.dig('site_id')).to eq(site_id)
      end

      it 'returns a hash with job status' do
        expect(service.dig('message')).to eq('working')
      end
    end

    context 'with a retrying job' do
      before do
        allow(Sidekiq::Status).to receive(:get_all).with(job_id).and_return(data)
        allow(Sidekiq::Status).to receive(:retrying?).and_return(true)
      end

      it 'returns a hash with site id' do
        expect(service.dig('site_id')).to eq(site_id)
      end

      it 'returns a hash with job status' do
        expect(service.dig('message')).to eq('retrying')
      end
    end

    context 'with a completed job' do
      before do
        allow(Sidekiq::Status).to receive(:get_all).with(job_id).and_return(data)
        allow(Sidekiq::Status).to receive(:complete?).and_return(true)
      end

      it 'returns a hash with site id' do
        expect(service.dig('site_id')).to eq(site_id)
      end

      it 'returns a hash with job status' do
        expect(service.dig('message')).to eq('completed')
      end
    end

    context 'with a failed job' do
      before do
        allow(Sidekiq::Status).to receive(:get_all).with(job_id).and_return(data)
        allow(Sidekiq::Status).to receive(:failed?).and_return(true)
      end

      it 'returns a hash with site id' do
        expect(service.dig('site_id')).to eq(site_id)
      end

      it 'returns a hash with job status' do
        expect(service.dig('message')).to eq('failed')
      end
    end

    context 'with a interuped job' do
      before do
        allow(Sidekiq::Status).to receive(:get_all).with(job_id).and_return(data)
        allow(Sidekiq::Status).to receive(:interrupted?).and_return(true)
      end

      it 'returns a hash with site id' do
        expect(service.dig('site_id')).to eq(site_id)
      end

      it 'returns a hash with job status' do
        expect(service.dig('message')).to eq('interrupted')
      end
    end
  end
end
