require 'rails_helper'

RSpec.describe Project, type: :model do

  describe 'attributes' do
    it { should have_attribute :title}
    it { should have_attribute :description }
    it { should have_attribute :status }
    it { should have_attribute :user_id }
    it { should have_attribute :slug }
    it { should have_attribute :github_url }
    it { should have_attribute :pivotaltracker_url }
    it { should have_attribute :commit_count }
    it { should have_attribute :image_url }
    it { should have_attribute :last_github_update}
    it { should have_attribute :slack_channel_name }
  end

  describe 'validations' do
    it { should validate_presence_of :title  }
    it { should validate_presence_of :description }
    it { should validate_presence_of :status  }
  end
end
