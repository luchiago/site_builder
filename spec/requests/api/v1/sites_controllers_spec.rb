# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::SitesController, type: :request do
  describe 'POST /api/v1/sites' do
    subject(:perform_request) { post api_v1_sites_path, params: params }

    let(:basic_info) { build(:basic_info) }

    describe 'valid site params' do
      context 'with only the basic info' do
        let(:params) { { site: { basic_info: basic_info } } }

        before { perform_request }

        it 'returns stauts 202' do
          expect(response).to have_http_status(:accepted)
        end

        it 'enqueue a job with correct params' do
          expect(BuildWorker).to have_enqueued_sidekiq_job(Site.last.id, { basic_info: basic_info })
        end

        it 'returns the side id' do
          expect(json.dig('site_id')).to eq(Site.last.id)
        end
      end

      context 'with some widgets' do
        let(:calendar) { build(:calendar) }
        let(:text_content) { [build(:text_content)] }
        let(:params) do
          {
            site: {
              basic_info: basic_info,
              calendar: calendar,
              text_content: text_content
            }
          }
        end

        before { perform_request }

        it 'returns stauts 202' do
          expect(response).to have_http_status(:accepted)
        end
      end
    end

    describe 'invalid site params' do
      context 'without basic info' do
        let(:params) { { site: { calendar: build(:calendar) } } }

        before { perform_request }

        it 'returns stauts 400' do
          expect(response).to have_http_status(:unprocessable_entity)
        end

        it 'enqueue a job with correct params' do
          expect(BuildWorker).not_to have_enqueued_sidekiq_job
        end

        it 'returns errors' do
          expect(json.dig('errors')).not_to be_empty
        end
      end
    end
  end

  describe 'PUT /api/v1/sites/:id' do
    subject(:perform_request) { put api_v1_site_path(site), params: params }

    let(:site) { Site.create }
    let(:basic_info) { build(:basic_info) }

    describe 'valid site params' do
      context 'with only the basic info' do
        let(:params) { { site: { basic_info: basic_info } } }

        before { perform_request }

        it 'returns stauts 202' do
          expect(response).to have_http_status(:accepted)
        end

        it 'enqueue a job with correct params' do
          expect(BuildWorker).to have_enqueued_sidekiq_job(Site.last.id, { basic_info: basic_info })
        end
      end

      context 'with some widgets' do
        let(:calendar) { build(:calendar) }
        let(:text_content) { [build(:text_content)] }
        let(:params) do
          {
            site: {
              basic_info: basic_info,
              calendar: calendar,
              text_content: text_content
            }
          }
        end

        before { perform_request }

        it 'returns stauts 202' do
          expect(response).to have_http_status(:accepted)
        end
      end
    end

    describe 'invalid site params' do
      context 'without basic info' do
        let(:params) { { site: { calendar: build(:calendar) } } }

        before { perform_request }

        it 'returns stauts 400' do
          expect(response).to have_http_status(:unprocessable_entity)
        end

        it 'enqueue a job with correct params' do
          expect(BuildWorker).not_to have_enqueued_sidekiq_job
        end

        it 'returns errors' do
          expect(json.dig('errors')).not_to be_empty
        end
      end
    end
  end

  describe 'GET /api/v1/sites/:id/build' do
    subject(:perform_request) { get "/api/v1/sites/#{site.id}/build" }

    let!(:site) { Site.create }
    let!(:build) { Build.create(site: site) }

    context 'with an existent site' do
      before { perform_request }

      it 'returns status 200' do
        expect(response).to have_http_status(:ok)
      end

      it 'returns all site builds' do
        expect(json.first).to eq(to_json(build))
      end
    end

    context 'with an inexistent site' do
      before { get "/api/v1/sites/#{site.id + 1}/build" }

      it 'returns status 404' do
        expect(response).to have_http_status(:not_found)
      end

      it 'returns an error message' do
        expect(json.dig('errors')).to eq('Not Found')
      end
    end
  end

  describe 'GET /api/v1/sites/:id/' do
    subject(:perform_request) { get "/api/v1/sites/#{site.id}/" }

    let(:html) { '<html><body>Test</body></html>' }
    let!(:site) { Site.create }
    let!(:build) { Build.create(html_build: html, site: site) }

    context 'with an existent site' do
      before do
        site.update(current_build: build)
        perform_request
      end

      it 'returns status 200' do
        expect(response).to have_http_status(:ok)
      end

      it 'returns site current html build' do
        expect(response.body).to eq(html)
      end

      it 'returns html content' do
        expect(response.content_type).to eq('text/html; charset=utf-8')
      end
    end

    context 'with an inexistent site' do
      let(:site) { Site.create }

      before { get "/api/v1/sites/#{site.id + 1}/" }

      it 'returns status 404' do
        expect(response).to have_http_status(:not_found)
      end

      it 'returns an error message' do
        expect(json.dig('errors')).to eq('Not Found')
      end
    end
  end
end
