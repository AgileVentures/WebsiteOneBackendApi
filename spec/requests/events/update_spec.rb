# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EventsController do
  describe '#update' do
    let(:user) { create(:user) }
    let(:headers) { { 'Accept' => 'application/json', 'Content-Type' => 'application/json' } }
    let(:auth_headers) { Devise::JWT::TestHelpers.auth_headers(headers, user) }
    let(:json_response) { JSON.parse(response.body, symbolize_names: true) }
    let(:event) { create(:event) }

    before do
      put(event_path(event), params: params, headers: auth_headers, as: :json)
    end

    describe 'valid params' do
      let(:params) { { event: { name: 'Updated Event', category: 'Scrums' } } }

      context 'with a valid event id'
      it 'responds with status 200' do
        expect(response).to have_http_status :ok
      end

      it 'does update the event' do
        expect(json_response).to include(params[:event])
      end

      context 'with an invalid event id' do
        let(:event) { 'invalid' }

        it 'responds with record not found' do
          expect(response).to have_http_status :not_found
        end
      end
    end

    describe 'invalid params' do
      context 'with an invalid payload' do
        let(:params) { {} }

        it 'responds with bad request' do
          expect(response).to have_http_status :bad_request
        end
      end

      context 'with an invalid event' do
        let(:params) { { event: { name: nil } } }

        it 'responds with unprocessable entity' do
          expect(response).to have_http_status :unprocessable_entity
        end
      end
    end
  end
end
