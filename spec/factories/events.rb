# frozen_string_literal: true

# This will guess the Event class
FactoryBot.define do
  factory :event do
    name { 'Random Event' }
    time_zone { 'UTC + 3' }
    repeats { 'once' }
    category { 'Pair programing' }
    start_datetime { 1.month.from_now }
    duration { 60 }
  end

  factory :invalid_event, class: Event do
    name { '' }
    time_zone { '' }
    repeats { '' }
    category { 'Pair programing' }
    start_datetime { Date.parse('31-12-2010') }
    duration {}
  end
end
