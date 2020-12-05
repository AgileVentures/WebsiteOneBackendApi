# frozen_string_literal: true

module Types
  class EventType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :category, String, null: false
    field :project_id, ID, null: true
    field :start_datetime, GraphQL::Types::ISO8601DateTime, null: false
    field :time_zone, String, null: false
    field :repeats, String, null: false
    field :repeat_ends, Boolean, null: true
    field :repeats_every_n_weeks, Int, null: false
    field :repeat_ends_on, GraphQL::Types::ISO8601DateTime, null: true
    field :repeats_weekly_each_days_of_the_week_mask, Int, null: false
    field :duration, Int, null: false
    field :description, String, null: true
    field :slug, String, null: false
  end
end
