require 'rails_helper'

RSpec.describe 'Next Event' do

  it 'queries and returns the next event' do
    create(:event, name: 'Event Name',
                   start_datetime: DateTime.yesterday,
                   duration: '1',
                   repeats: 'weekly')

    query_string = <<-GRAPHQL
    query
      {
        nextEvent(slug: "event-name") {
          event {
            id
            name
          }
          time
        }
      }
    GRAPHQL
               
    result = WebsiteOneBackendApiSchema.execute(query_string)['data']['nextEvent']
               
    expect(result['event']['name']).to eq "Event Name"
  end
end