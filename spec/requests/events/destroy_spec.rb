# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EventsController do
  let!(:event) { create(:event) }
  let(:user) { create(:user) }
  let(:headers) { { 'Accept' => 'application/json', 'Content-Type' => 'application/json' } }
  let(:auth_headers) { Devise::JWT::TestHelpers.auth_headers(headers, user) }

  before(:example) do
    delete(event_path(id), headers: auth_headers)
  end

  describe '#delete' do
    describe 'authenticated user' do
      context 'valid params' do
        let(:id) { event }

        it 'destroys an event' do
          expect(Event.count).to eq(0)
        end

        it 'responds with the correct status' do
          expect(response).to have_http_status :no_content
        end
      end

      context 'invalid params' do
        let(:id) { 'invalid' }

        it 'does not delete the event' do
          expect(Event.count).to eq(1)
        end

        it 'responds with the correct status' do
          expect(response).to have_http_status :not_found
        end
      end
    end

    context 'unauthenticated user' do
      context 'valid params' do
        let(:auth_headers) { headers.tap { |h| h['Authorization'] = '' } }
        let(:id) { event }
        it 'responds with 401 status' do
          expect(response.status).to eq(401)
        end

        it 'does not delete record in the events table' do
          expect(Event.count).to eq(1)
        end
      end
    end
  end
end
