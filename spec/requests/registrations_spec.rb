# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'RegistrationsController' do
  describe '/registrations' do
    let(:valid_params) do
      { user: {
        first_name: 'test',
        last_name: 'user',
        email: 'test@email.com',
        password: 'test1234',
        password_confirmation: 'test1234',
        country_name: 'Kenya',
        city: 'Kisumu',
        region: 'Africa/Nairobi',
        country_code: '254',
        timezone_offset: '+3'
      } }
    end
    let(:invalid_params) do
      { user: {
        first_name: 'test',
        last_name: 'user',
        email: '',
        password: nil,
        password_confirmation: 'test1234',
        country_name: 'Kenya',
        city: 'Kisumu',
        region: 'Africa/Nairobi',
        country_code: '254',
        timezone_offset: '+3'
      } }
    end
    let(:endpoint) { '/signup' }

    describe 'success' do
      subject { post endpoint, params: valid_params }

      it 'creates a user with valid params' do
        expect { subject }.to change(User, :count).by(1)
      end

      it 'it returns an authorization token in the header' do
        subject
        headers = response.headers
        expect(headers.keys).to include('Authorization')
      end

      it 'returns valid JWT token' do
        subject
        token_from_request = response.headers['Authorization'].split(' ').last
        decoded_token = JWT.decode(token_from_request, Rails.application.credentials.devise_jwt[:key], true)
        expect(decoded_token.first['sub']).to be_present
      end
    end

    describe 'error' do
      it 'responds to error with message' do
        post endpoint, params: invalid_params
        json_response = response.parsed_body
        expect(json_response['errors'][0]['title']).to eq('Bad Request')
      end
    end
  end
end
