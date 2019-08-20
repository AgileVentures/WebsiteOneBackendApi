require 'rails_helper'

RSpec.describe Event do
  describe 'attributes' do
    it { should have_attribute :name }
    it { should have_attribute :description }
    it { should have_attribute :category }
    it { should have_attribute :repeats }
    it { should have_attribute :repeats_every_n_weeks }
    it { should have_attribute :repeats_weekly_each_days_of_the_week_mask }
    it { should have_attribute :repeat_ends }    
    it { should have_attribute :repeat_ends_on }
    it { should have_attribute :time_zone }
    it { should have_attribute :url }
    it { should have_attribute :slug }
    it { should have_attribute :start_datetime }
    it { should have_attribute :duration }
    it { should have_attribute :for }
    it { should have_attribute :exclusions }
    it { should have_attribute :creator_attendance }
  end

  describe 'Validations' do
    it { should validate_presence_of :name}
    it { should validate_presence_of :time_zone}
    it { should validate_presence_of :repeats}
    it { should validate_presence_of :category}
    it { should validate_presence_of :start_datetime}
    it { should validate_presence_of :duration}
  end

end