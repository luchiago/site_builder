# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::JobsController, type: :request do
  describe 'GET /api/v1/status/:jid' do
    subject(:perform_request) { get "/api/v1/status/#{job_id}" }

    let(:job_id) { Faker::Internet.uuid }
    let(:site_id) { Faker::Internet.uuid }
    let(:service) { double }
    let(:payload) { { message: status, site_id: site_id } }

    context 'with an existent job_id' do
      let(:status) { 'completed' }

      before do
        allow(FindJobService).to receive(:new).with(job_id).and_return(service)
        allow(service).to receive(:perform).and_return(payload)
        perform_request
      end

      it 'returns status 200' do
        expect(response).to have_http_status(:ok)
      end

      it 'returns the status message' do
        expect(json.dig('message')).to eq(status)
      end

      it 'returns the site id' do
        expect(json.dig('site_id')).to eq(site_id)
      end
    end

    context 'with an inexistent job_id' do
      let(:status) { 'completed' }

      before do
        allow(FindJobService).to receive(:new).with(job_id).and_return(service)
        allow(service).to receive(:perform).and_return({})
        perform_request
      end

      it 'returns status 404' do
        expect(response).to have_http_status(:not_found)
      end

      it 'returns the status message' do
        expect(json.dig('errors')).to eq('Not Found')
      end
    end
  end
end
