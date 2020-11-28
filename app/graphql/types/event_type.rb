# frozen_string_literal: true

module Types
  class EventType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :category, String, null: false
    field :time_zone, String, null: false
    field :repeats, String, null: false
    field :start_datetime, GraphQL::Types::ISO8601DateTime, null: false
    field :duration, Int, null: false
    field :description, String, null: true
    field :slug, String, null: false
  end
end
