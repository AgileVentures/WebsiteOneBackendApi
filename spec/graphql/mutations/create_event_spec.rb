require 'rails_helper'

class Mutations::CreateEventTest < ActiveSupport::TestCase
  context 'event creation' do
    let(:event) { perform(
      name: "some event", 
      category: "PairProgramming", 
      time_zone: "UTC", 
      repeats: "never",
      start_datetime: "2018-08-05 14:19:00",
      duration: 60
    ) }
    
    def perform(user: nil, **args)
      Mutations::CreateEvent.new(object: nil, field: nil, context: {}).resolve(args)
    end

    it 'writes to the database' do
      expect(event.persisted?).to eq(true)
    end
    
    it 'saves with correct values' do
      expect(event).to have_attributes(name: 'some event', category: 'PairProgramming', time_zone: 'UTC', repeats: 'never', duration: 60)
    end

    it 'sets the start_datetime' do
      expect(event.start_datetime).to eq("2018-08-05 14:19:00")
    end
  end
end
