# frozen_string_literal: true

require 'rails_helper'

class CreateEventTest < ActiveSupport::TestCase
  context 'event creation' do
    let(:event) do
      perform(
        name: 'some event',
        category: 'PairProgramming',
        time_zone: 'UTC',
        repeats: 'never',
        start_datetime: '2018-08-05 14:19:00',
        duration: 60,
        repeat_ends: true
      )
    end

    def perform(**args) #(user: nil, **args)
      Mutations::CreateEvent.new(object: nil, field: nil, context: {}).resolve(args)
    end

    it 'writes to the database' do
      expect(event.persisted?).to eq(true)
    end

    it 'saves with correct values' do
      expect(event).to have_attributes(name: 'some event', category: 'PairProgramming',
        time_zone: 'UTC', repeats: 'never', duration: 60, repeat_ends: true)
    end

    it 'sets the start_datetime' do
      expect(event.start_datetime).to eq('2018-08-05 14:19:00')
    end
  end

  context 'repeating event creation' do
    let(:event) do
      perform(
        name: 'another event',
        category: 'PairProgramming',
        time_zone: 'UTC',
        repeats: 'weekly',
        start_datetime: '2018-08-06 14:20:00',
        duration: 60,
        repeat_ends: true,
        repeats_every_n_weeks: 1,
        repeat_ends_on: '2018-12-01',
        repeats_weekly_each_days_of_the_week_mask: 1
      )
    end

    def perform(**args) #(user: nil, **args)
      Mutations::CreateEvent.new(object: nil, field: nil, context: {}).resolve(args)
    end

    it 'writes to the database' do
      expect(event.persisted?).to eq(true)
    end

    it 'saves with correct values' do
      expect(event).to have_attributes(name: 'another event', category: 'PairProgramming',
        time_zone: 'UTC', repeats: 'weekly', duration: 60, repeat_ends: true,
        repeats_every_n_weeks: 1)
    end

    it 'sets the start_datetime' do
      expect(event.start_datetime).to eq('2018-08-06 14:20:00')
    end
  end
end
