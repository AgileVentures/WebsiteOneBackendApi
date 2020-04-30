# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EventsController do
  let(:endpoint) { '/events' }
  let(:event_name) { 'Hello Senpai' }

  before :example do
    get event_path(event)
  end

  context 'with a valid event' do
    let(:event) { create(:event, name: event_name) }

    example 'returns an OK status' do
      expect(response.status).to eq 200
    end

    example 'returns a proper JSON response' do
      hash = JSON.parse(response.body, symbolize_names: true)

      expect(hash).to include(name: event_name)
    end
  end

  context 'with an invalid event' do
    let(:event) { 'xyz' }

    it 'returns an error status' do
      expect(response.status).to eq 404
    end
  end
end
