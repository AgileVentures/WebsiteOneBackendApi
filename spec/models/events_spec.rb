# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Event do
  describe 'attributes' do
    it { should have_attribute :name }
    it { should have_attribute :category }
    it { should have_attribute :repeats }
    it { should have_attribute :time_zone }
    it { should have_attribute :start_datetime }
    it { should have_attribute :duration }
  end
end
