# frozen_string_literal: true
module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField


    field :event, EventType, null: false, description: 'Query an event' do
      argument :slug, String, required: true
    end
    def event(slug:)
      Event.find_by(slug: slug)
    end

    field :events, [EventType], null: false, description: 'Query for all events' do
      argument :order_by, String, required: false
      argument :order_direction, String, required: false
    end
    def events(order_by: nil, order_direction: 'asc')
      if order_by
        Event.all.order(order_by + ' ' + order_direction)
      else
        Event.all
      end
    end

    field :upcoming_events, [UpcomingEventType], null: false, description: 'Query for upcoming events'
    def upcoming_events
      Event.upcoming_events
    end

    field :next_event, UpcomingEventType, null: false, description: 'Query for next event' do
      argument :slug, String, required: true
    end
    def next_event(slug:)
      e = Event.find_by(slug: slug)
      e.nil? ? e : e.next_event_occurrence_with_time
    end

    field :projects, [ProjectType], null: false, description: 'Query for all projects'
    def projects
      Project.all.where(status: 'Active').order('title')
    end
  end
end
