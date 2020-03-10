# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :events, [EventType], null: false,
                                description: 'Query for all events'
    def events
      Event.all
    end
  end
end
