# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EventsController do
  describe '#update' do
    let(:json_response) { JSON.parse(response.body).deep_symbolize_keys! }
    let(:event) { create(:event) }
    let(:headers) { {} }

    before do
      put(event_path(event), params: params, headers: headers)
    end

    describe 'valid params' do
      let(:params) { { event: { name: 'Updated Event', category: 'Scrums' } } }

      context 'with a valid event id'
        it 'responds with status 200' do
          expect(response.status).to eq(200)
        end

        it 'does update the event' do
          expect(json_response).to include(params[:event])
        end

      context 'with an invalid event id' do
        let(:event) { 'invalid' }

        it 'responds with record not found' do
          expect(response.status).to eq(404)
        end
      end
    end

    describe 'invalid params' do
      let(:params) { {} }

      it 'responds with bad request' do
        expect(response.status).to eq(400)
      end
    end
  end
end
