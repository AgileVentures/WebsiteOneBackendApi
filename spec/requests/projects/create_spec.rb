# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'ProjectController#create' do
  let(:path) { '/projects' }
  let(:user) { create(:user) }
  let(:headers) { { 'Accept' => 'application/json', 'Content-Type' => 'application/json' } }
  let(:auth_headers) { Devise::JWT::TestHelpers.auth_headers(headers, user) }

  before :example do
    post(path, params: params, headers: auth_headers, as: :json)
  end

  context 'with invalid credentials' do
    let(:auth_headers) { headers.tap { |h| h['Authorization'] = '' } }
    let(:project_params) { {project: { title: 'project', description: 'project description', status: 'Closed' } } }
    let(:params) { project_params }

    it 'responds with the correct error' do
      expect(response).to have_http_status(401)
    end

    it 'does not add a new record in the database' do
      expect { subject }.to change { Project.count }.by (0)
    end
  end

  context 'with valid credentials' do
    context 'with valid params' do
      let(:project_params) { {project: { title: 'project', description: 'project description', status: 'Closed' } } }
      let(:params) { project_params }

      it 'responds with status 201' do
        expect(response).to have_http_status(201)
      end

      it 'has the correct response body' do
        expect(response.parsed_body.deep_symbolize_keys!).to include(project_params[:project])
      end

      context 'with new record in database' do
        subject { post(path, params: params, headers: auth_headers, as: :json) }

        it 'creates a record in the database' do
          expect { subject }.to change(Project, :count).by (1)
        end
      end
    end

    context 'with invalid params' do
      let(:params) { { project: { title: '' } } }

      it 'responds with a status of Unprocessable Entity(422)' do
        expect(response.status).to eq(422)
      end

      context 'with database changes' do
        subject { post(path, params: params, headers: auth_headers, as: :json) }

        it 'does not add a new record in the database' do
          expect { subject }.to change { Project.count }.by (0)
        end
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
