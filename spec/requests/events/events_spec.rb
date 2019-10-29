# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EventsController do
  let(:endpoint) { '/events' }
  let(:event_params) { { name: 'Random Event', time_zone: 'UTC + 3', repeats: 'once', category: 'Pair programing', start_datetime: Date.parse('31-12-2010'), duration: 60 } }
  let(:invalid_event_params) { { name: nil, time_zone: 'UTC + 3', repeats: nil, category: 'Pair programing', start_datetime: Date.parse('31-12-2010'), duration: nil } }
  context 'GET /events' do
    context 'succesful' do
      subject { get endpoint }
      it 'responds with success' do
        subject
        expect(response).to have_http_status(:success)
      end

      it 'JSON body is empty array if there are no records in database' do
        subject
        json_response = response.parsed_body
        expect(json_response).to eq([])
      end

      it 'JSON response has correct attributes' do
        Event.create(event_params)
        subject
        json_response = response.parsed_body
        json_response.each do |event|
          expect(event.keys).to match_array(%w[category created_at creator_attendance creator_id description duration exclusions for id modifier_id name project_id repeat_ends repeat_ends_on repeats repeats_every_n_weeks repeats_weekly_each_days_of_the_week_mask slug start_datetime time_zone updated_at url])
        end
      end
    end
  end

  context 'POST /events' do
    context 'valid params' do
      subject { post '/events', params: { event: event_params } }
      it 'responds with 200 status' do
        subject
        expect(response.status).to eq(201)
      end

      it 'adds one record in the events table' do
        expect { subject }.to change { Event.count }.by 1
      end
    end
    context 'invalid params' do
      subject { post '/events', params: { event: invalid_event_params } }
      it 'responds with 422 status' do
        subject
        expect(response.status).to eq(422)
      end
      it 'does not change the count of event records' do
        expect { subject }.to change { Event.count }.by 0
      end
      it 'responds with correct error messages' do
        subject
        json_response = response.parsed_body
        expect(json_response['name']).to eq(["can't be blank"])
        expect(json_response['repeats']).to eq(["can't be blank"])
        expect(json_response['duration']).to eq(["can't be blank"])
      end
    end
  end

  context 'PUT /events' do
    let(:event) { Event.create(event_params) }

    context 'valid params' do
      subject { put event_path(event), params: { event: update_event_valid_params } }
      let(:update_event_valid_params) { { name: 'Updated Event', category: 'Scrums' } }
      it 'responds with status 200' do
        subject
        expect(response.status).to eq(200)
      end
      it 'returns an updated event' do
        subject
        json_response = response.parsed_body
        expect(json_response['name']).to eq(update_event_valid_params[:name])
        expect(json_response['category']).to eq(update_event_valid_params[:category])
      end
    end

    context 'invalid params' do
      subject { put event_path(event), params: { event: update_event_invalid_params } }
      let(:update_event_invalid_params) { { name: nil, category: nil } }
      it 'responds with a 422 status' do
        subject
        expect(response.status).to eq(422)
      end

      it 'responds with the correct error messages' do
        subject
        json_response = response.parsed_body
        expect(json_response['name']).to eq(["can't be blank"])
        expect(json_response['category']).to eq(["can't be blank"])
      end
    end
  end
  describe 'Events#Show' do
    let(:event) { Event.create(event_params) }
    context 'with a valid event' do
      it 'should respond with status ok' do
        get event_path(event)
        expect(response.status).to eq 200
      end
    end

    context 'an invalid event' do
      it 'should raise status 400' do
        get event_path('xyz')
        expect(response.status).to eq 404
      end
    end
  end

  context 'Events#Delete' do
    context 'record in the database' do
      it 'should destroy a user' do
        event = Event.create(event_params)
        expect { delete event_path(event), as: :json }.to change { Event.count }.by -1
        assert_response :no_content
      end
    end
    context 'record not in database' do
      it 'responds with 404 and does not delete any event' do
        event = Event.create(event_params)
        event.delete
        expect { delete event_path(event), as: :json }.to change { Event.count }.by 0
        expect(response.status).to eq 404
      end
    end
  end
end
