module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :all_events, [EventType], null: false,
      description: "Query for all events"
    def all_events
      Event.all
    end
  end
end
