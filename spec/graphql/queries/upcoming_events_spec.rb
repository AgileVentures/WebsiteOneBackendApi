require 'rails_helper'
require 'graphql_helper'

RSpec.describe 'Upcoming Events' do

  it 'queries and returns upcoming events up to limit of 100' do
    create(:event, name: 'EventName',
                   start_datetime: DateTime.tomorrow,
                   duration: '1',
                   repeats: 'weekly')

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
