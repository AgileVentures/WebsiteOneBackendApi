# frozen_string_literal: true

require 'rails_helper'
require 'graphql_helper'

RSpec.describe 'Events' do

  it 'queries and returns an event' do
    create(:event, name: 'FirstEvent')

    query_string = <<-GRAPHQL
    query
     {
       event (slug: "firstevent") {
          id
          duration
          name
        }
      }
      GRAPHQL

    result = WebsiteOneBackendApiSchema.execute(query_string)['data']['event']

    expect(result['name']).to eq 'FirstEvent'
  end

  it 'queries and returns all events' do
    create(:event, name: 'FirstEvent')
    create(:event, name: 'AnotherEvent')

    query_string = <<-GRAPHQL
    query
     {
       events {
          id
          duration
          name
        }
      }
      GRAPHQL

    result = WebsiteOneBackendApiSchema.execute(query_string)['data']['events']

    expect(result).to json_contains('FirstEvent', 'name')
    expect(result).to json_contains('AnotherEvent', 'name')
  end
end