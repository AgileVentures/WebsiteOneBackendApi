# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    username { 'testuser' }
    email { 'test@user.com' }
    password { 'testpassword' }
  end
end
