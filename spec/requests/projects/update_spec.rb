# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'ProjectController#update' do
  let(:headers) { {} }

  before :example do
    put(project_path(project), params: params, headers: headers)
  end

  context 'with invalid credentials' do
  end

  context 'with valid credentials' do
    let(:project_params) { { title: 'good project', description: 'good project description', status: 'Closed' } }
    let(:project) { create(:project) }

    context 'with valid params' do
      let(:params) { { project: project_params } }

      it 'responds with status 200' do
        expect(response).to have_http_status(200)
      end

      it 'has the correct response body' do
        expect(response.parsed_body.deep_symbolize_keys!).to include(project_params)
      end
    end

    context 'with invalid params' do
      let(:params) { { project: { title: '' } } }

      it 'responds with a status of Unprocessable Entity(422)' do
        expect(response.status).to eq(422)
      end

      it "doesn't update the project" do
        not_updated_project = Project.find(project.id)
        expect(not_updated_project.title).to eq(project.title)
      end

      context 'with an empty param object' do
        let(:params) { { project: {} } }

        it 'returns status 400' do
          expect(response.status).to eq 400
        end
      end
    end
  end
end
