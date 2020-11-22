# frozen_string_literal: true

module Types
  class UpcomingEventType < Types::BaseObject
    field :event, Types::EventType, null: false
    field :time, GraphQL::Types::ISO8601DateTime, null: false
  end
end