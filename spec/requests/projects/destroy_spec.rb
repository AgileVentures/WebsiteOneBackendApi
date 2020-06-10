# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'ProjectsController#destroy' do
  let!(:project) { create(:project) }
  let(:user) { create(:user) }
  let(:headers) { { 'Accept' => 'application/json', 'Content-Type' => 'application/json' } }
  let(:auth_headers) { Devise::JWT::TestHelpers.auth_headers(headers, user) }

  before(:example) do
    delete(project_path(id), headers: auth_headers)
  end

  context 'with invalid credentials' do
    let(:auth_headers) { headers.tap {|h| h['Authorization'] = ''} }
    let(:id) { project }

    it 'responds with the correct error' do
      expect(response).to have_http_status(401)
    end

    it 'does not add a new record in the database' do
      expect { subject }.to change { Project.count }.by (0)
    end
  end

  context 'with invalid credentials' do
    context 'valid params' do
      let(:id) { project }

      it 'destroys an project' do
        expect(Project.count).to eq(0)
      end

      it 'responds with the correct status' do
        expect(response).to have_http_status :no_content
      end
    end

    context 'invalid params' do
      let(:id) { 'invalid' }

      it 'does not delete the project' do
        expect(Project.count).to eq(1)
      end

      it 'responds with the correct status' do
        expect(response).to have_http_status :not_found
      end
    end
  end
end
