# frozen_string_literal: true

module Mutations
  class CreateEvent < BaseMutation
    argument :name, String, required: true
    argument :category, String, required: true
    argument :time_zone, String, required: true
    argument :repeats, String, required: true
    argument :start_datetime, GraphQL::Types::ISO8601DateTime, required: true
    argument :duration, Int, required: true

    type Types::EventType

    def resolve(event_params)
      Event.create!(event_params)
    end
  end
end

private

  def event_params
    params.require(:event).permit(:name, :time_zone, :repeats, :category, :start_datetime, :duration)
  end