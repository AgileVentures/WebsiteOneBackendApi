# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'ProjectController#update' do
  let(:user) { create(:user) }
  let(:headers) { { 'Accept' => 'application/json', 'Content-Type' => 'application/json' } }
  let(:auth_headers) { Devise::JWT::TestHelpers.auth_headers(headers, user) }
  let(:project_params) { { title: 'good project', description: 'good project description', status: 'Closed' } }
  let(:project) { create(:project) }
  let(:params) { { project: project_params } }

  before :example do
    put(project_path(project), params: params, headers: auth_headers, as: :json)
  end

  context 'with invalid credentials' do
    let(:auth_headers) { headers.tap {|h| h['Authorization'] = ''} }

    it 'responds with the correct error' do
      expect(response).to have_http_status(401)
    end

    it 'does not add a new record in the database' do
      expect(response.parsed_body.deep_symbolize_keys!).to_not include(project_params)
    end
  end

  context 'with valid credentials' do
    context 'with valid params' do
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
