# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'ProjectsController#show' do
  context 'with valid parameters' do
    let(:project_attributes) do
      {
        title: 'Amazing project',
        status: 'Active',
        description: 'Amazing project description'
      }
    end

    let(:project) { create(:project, project_attributes) }

    before(:example) { get(project_path(project)) }

    it 'responds with status code 200' do
      expect(response.status).to eq 200
    end

    it 'returns the correct result' do
      expect(response.parsed_body.deep_symbolize_keys!).to include(project_attributes)
    end
  end

  context 'with invalid parameters' do
    let(:project) { 2 } 

    before(:example) { get(project_path(project)) }

    it 'responds with 404' do
      expect(response.status).to eq 404
    end
  end

end
