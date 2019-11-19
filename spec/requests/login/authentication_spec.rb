# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'POST /login', type: :request do
  let(:user) { create(:user) }
  let(:url) { '/login' }
  let(:params) do
    {
      user: {
        email: user.email,
        password: user.password
      }
    }
  end

  context 'when params are correct' do
    before do
      post url, params: params
    end

    it 'returns 200' do
      expect(response).to have_http_status(200)
    end
  end
end
