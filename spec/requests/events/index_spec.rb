# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EventsController do
  let(:params) { {} }
  let(:path) { '/events' }
  let(:event) { nil }

  before(:example) do
    event

    get(path, params: params)
  end

  describe '#index' do
    let(:json_response) { response.parsed_body.symbolize_keys! }
    context 'succesful' do
      it 'responds with success' do
        expect(response).to have_http_status(:success)
      end

      context 'when there are no records' do
        it 'returns a proper JSON response' do
          expect(json_response).to eq({ events: [] })
        end
      end

      context 'when there are records' do
        let(:event) { create(:event) }

        it 'returns a proper JSON response' do
          expect(json_response[:events].first).to include(
            'category' => event.category,
            'creator_attendance' => event.creator_attendance,
            'creator_id' => event.creator_id,
            'description' => event.description,
            'duration' => event.duration,
            'exclusions' => event.exclusions,
            'for' => event.for,
            'id' => event.id,
            'modifier_id' => event.modifier_id,
            'name' => event.name,
            'project_id' => event.project_id,
            'repeat_ends' => event.repeat_ends,
            'repeat_ends_on' => event.repeat_ends_on,
            'repeats' => event.repeats,
            'repeats_every_n_weeks' => event.repeats_every_n_weeks,
            'repeats_weekly_each_days_of_the_week_mask' => event.repeats_weekly_each_days_of_the_week_mask,
            'slug' => event.slug,
            'time_zone' => event.time_zone,
            'url' => event.url
          )
        end
      end
    end
  end
end
