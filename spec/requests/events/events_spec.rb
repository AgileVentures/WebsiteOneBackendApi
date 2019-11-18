# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EventsController do
  let(:user) { create(:user) }
  let(:headers) { { 'Accept' => 'application/json', 'Content-Type' => 'application/json' } }
  let(:auth_headers) { Devise::JWT::TestHelpers.auth_headers(headers, user) }
  let(:endpoint) { '/events' }
  let(:event) { create(:event) }
  let(:invalid_event) { create(:invalid_event) }

  context 'GET /events' do
    context 'succesful' do
      subject { get endpoint, headers: auth_headers }
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
        create_list(:event, 10)
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
      subject { post '/events', params: { event: attributes_for(:event) } }
      it 'responds with 200 status' do
        subject
        expect(response.status).to eq(201)
      end

      it 'adds one record in the events table' do
        expect { subject }.to change { Event.count }.by 1
      end
    end

    context 'invalid params' do
      subject { post '/events', params: { event: attributes_for(:invalid_event) } }
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
    context 'valid params' do
      let(:update_event_valid_params) { { name: 'Updated Event', category: 'Scrums' } }
      subject { put event_path(event), params: { event: update_event_valid_params } }
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
    let(:event) { create(:event) }
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
        event = create(:event)
        expect { delete event_path(event), as: :json }.to change { Event.count }.by -1
        assert_response :no_content
      end
    end

    context 'record not in database' do
      it 'responds with 404 and does not delete any event' do
        event = create(:event)
        event.delete
        expect { delete event_path(event), as: :json }.to change { Event.count }.by 0
        expect(response.status).to eq 404
      end
    end
  end
end
