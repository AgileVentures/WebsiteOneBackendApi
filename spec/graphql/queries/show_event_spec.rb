# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Events' do
   
  it "queries and returns all events" do
    e = create(:event, name: 'FirstEvent')
    e2 = create(:event, name: 'AnotherEvent')
    
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
      
    result = WebsiteOneBackendApiSchema.execute(query_string)["data"]["events"]
  
    names = result.collect {|x| x["name"]}

    assert names.detect { |e| e == 'FirstEvent' }
    assert names.detect { |e| e == 'AnotherEvent' }
  end
end