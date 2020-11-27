# frozen_string_literal: true
module Types
  class QueryType < Types::BaseObject

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
  end
end
