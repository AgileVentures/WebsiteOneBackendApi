require 'rails_helper'

RSpec.describe 'POST /users' do
  before do
    @user = { user: { email: 'user@example.com', password: 'example', password_confirmation: 'example' }}
  end
  subject { post '/users', params: @user }

  it('returns success') do
    binding.pry
    subject
    expect(response.status).to eq(200)
  end

  it 'saves the user' do
    expect{subject}.to change{User.count}.by (1)
  end
  # it returns the user
end
