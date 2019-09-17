require 'rails_helper'

RSpec.describe EventsController do
  
  let(:endpoint) { '/events' }
  
  context 'GET /events' do
    context 'succesful' do
      before do
        get endpoint
      end
      it 'responds with success' do
        expect(response).to have_http_status(:success)
      end
  
      it 'JSON body is empty array if there are no records in database' do
        json_response = JSON.parse(response.body)
        expect(json_response).to eq([])
      end
  
      it 'JSON response has correct attributes' do
        Event.create(name: 'Random Event', time_zone: 'UTC + 3', repeats:'once', category: 'Pair programing', start_datetime: Date.parse('31-12-2010'), duration: 60)
        get endpoint
        json_response = JSON.parse(response.body)
        json_response.each do |event| 
            expect(event.keys).to match_array( ["category", "created_at", "creator_attendance", "creator_id", "description", "duration", "exclusions", "for", "id", "modifier_id", "name", "project_id", "repeat_ends", "repeat_ends_on", "repeats", "repeats_every_n_weeks", "repeats_weekly_each_days_of_the_week_mask", "slug", "start_datetime", "time_zone", "updated_at", "url"])
        end
      end
    end
  end

  context 'create Events' do
    before do
      post events, {}
    end

  end

  
end
