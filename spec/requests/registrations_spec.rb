# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'RegistrationsController' do
  describe '/registrations' do
    let(:valid_params) { { username: 'testuser', email: 'test@email.com', password: 'test1234', password_confirmation: 'test1234' } }
    let(:endpoint) { '/users' }

    it 'creates a user with valid params' do
      post endpoint, params: { sign_up: debugger }
    end
  end
end
