# frozen_string_literal: true

module Mutations
  class CreateEvent < BaseMutation
    argument :name, String, required: true
    argument :category, String, required: true
    argument :description, String, required: true
    argument :project_id, Int, required: false
    argument :time_zone, String, required: true
    argument :repeats, String, required: true
    argument :start_datetime, GraphQL::Types::ISO8601DateTime, required: true
    argument :duration, Int, required: true
    argument :repeat_ends, Boolean, required: true
    argument :repeats_every_n_weeks, Int, required: false
    argument :repeat_ends_on, GraphQL::Types::ISO8601DateTime, required: false
    argument :repeats_weekly_each_days_of_the_week_mask, Int, required: false

    type Types::EventType

    def resolve(event_params)
      Event.create!(event_params)
    end
  end
end

private

def event_params
  params.require(:event).permit(:name, :description, :time_zone, :repeats, :category, :start_datetime, :duration,
    :repeat_ends, :repeats_every_n_weeks, :repeat_ends_on, :repeats_weekly_each_days_of_the_week_mask, :project_id)
end
