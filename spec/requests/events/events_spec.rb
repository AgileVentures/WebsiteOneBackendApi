# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EventsController do
  let(:endpoint) { '/events' }
  let(:event_params) {{name: 'Random Event', time_zone: 'UTC + 3', repeats: 'once', category: 'Pair programing', start_datetime: Date.parse('31-12-2010'), duration: 60}}

  context 'GET /events' do
    context 'succesful' do
      subject { get endpoint }
      it 'responds with success' do
        subject
        expect(response).to have_http_status(:success)
      end

      it 'JSON body is empty array if there are no records in database' do
        subject
        json_response = JSON.parse(response.body)
        expect(json_response).to eq([])
      end

      it 'JSON response has correct attributes' do
        Event.create(event_params)
        subject
        json_response = JSON.parse(response.body)
        json_response.each do |event|
        expect(event.keys).to match_array(%w[category created_at creator_attendance creator_id description duration exclusions for id modifier_id name project_id repeat_ends repeat_ends_on repeats repeats_every_n_weeks repeats_weekly_each_days_of_the_week_mask slug start_datetime time_zone updated_at url])
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
