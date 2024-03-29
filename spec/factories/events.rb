# frozen_string_literal: true

FactoryBot.define do
  factory :event do
    sequence(:name) { |n| "Event #{n}" }
    category { 'Scrum' }
    description { '' }
    start_datetime { '2014-03-07 23:30:00 UTC' }
    duration { '1' }
    repeats { 'weekly' }
    repeats_every_n_weeks { '1' }
    repeats_weekly_each_days_of_the_week_mask { '64' }
    repeat_ends_string { 'on' }
    repeat_ends_on { 5.years.from_now }
    time_zone { 'UTC' }
    repeat_ends { true }

    factory :recent_event do
      start_datetime { 8.hours.ago }
      repeat_ends_on { 1.year.from_now }
      repeats_weekly_each_days_of_the_week_mask { '127' }
    end
  end
  factory :invalid_event do
    name { nil }
  end
end
