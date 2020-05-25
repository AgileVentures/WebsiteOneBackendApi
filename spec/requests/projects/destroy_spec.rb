# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProjectsController do
  let!(:project) { create(:project) }
  let(:headers) { {} }

  before(:example) do
    delete(project_path(id), headers: headers)
  end

  describe '#delete' do
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
