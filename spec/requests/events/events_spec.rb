require 'rails_helper'

RSpec.describe 'GET /events' do
  let(:endpoint) { '/events' }

  context 'succesful' do
    it 'responds with success' do
      get endpoint
      expect(response).to have_http_status(:success)
    end
  end
end
