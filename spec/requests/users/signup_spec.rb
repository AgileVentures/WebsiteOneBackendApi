require 'rails_helper'

RSpec.describe 'POST /users' do
  before do
    user = { email: 'user@example.com', password: 'example'}
    post '/users', params: user
  end

  it('returns success') do
    expect(response.status).to eq(200)
  end
  # it saves the user
  # it returns the user
end
