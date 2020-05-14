# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EventsController do
  let(:user) { create(:user) }
  let(:headers) { { 'Accept' => 'application/json', 'Content-Type' => 'application/json' } }
  let(:auth_headers) { Devise::JWT::TestHelpers.auth_headers(headers, user) }
  let(:path) { '/events' }

  before(:example) do
    post(path, params: params, headers: auth_headers, as: :json)
  end

  describe '#create' do
    context 'valid params' do
      let(:params) { { event: attributes_for(:event) } }
      it 'responds with 200 status' do
        expect(response.status).to eq(201)
      end

      it 'adds one record in the events table' do
        expect(Event.count).to eq(1)
      end
    end

    context 'invalid params' do
      let(:params) { { event: attributes_for(:invalid_event) } }
      it 'responds with 422 status' do
        expect(response.status).to eq(422)
      end

      it 'does not change the count of event records' do
        expect(Event.count).to eq(0)
      end

      it 'responds with correct error messages' do
        json_response = response.parsed_body.deep_symbolize_keys!
        expect(json_response).to eq(
          name: ["can't be blank"],
          repeats: ["can't be blank"],
          duration: ["can't be blank"],
          time_zone: ["can't be blank"]
        )
      end
    end
  end
end
