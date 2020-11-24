require 'rails_helper'
require 'graphql_helper'

RSpec.describe 'Upcoming Events' do

  it 'queries and returns events in next 10 days' do
    create(:event, name: 'EventName',
                   start_datetime: DateTime.tomorrow,
                   duration: '1',
                   repeats: 'weekly'
          )

    query_string = <<-GRAPHQL
    query
      {
        upcomingEvents {
              event {
                id
                name
              }
              time
            }
      }
      GRAPHQL

    result = WebsiteOneBackendApiSchema.execute(query_string)['data']['upcomingEvents']

    expect(result.count).to eq 100
  end
end