require 'rails_helper'
require 'graphql_helper'

RSpec.describe 'Projects ' do

  it 'queries and returns projects' do
    create(:project, title: 'ProjectName',
                     status: 'Active',
                     description: 'A really cool project.')
    create(:project, title: 'ProjectTwoName',
                     status: 'Inactive',
                     description: 'A not so great project.')
    create(:project, title: 'ProjectThreeName',
                      status: 'Active',
                      description: 'Another good project.')

    query_string = <<-GRAPHQL
    query
      {
        projects {
          title
          status
          description
        }
      }
      GRAPHQL

    result = WebsiteOneBackendApiSchema.execute(query_string)['data']['projects']

    expect(result.count).to eq 2
    expect(result).to json_contains('ProjectName', 'title')
    expect(result).to json_contains('ProjectThreeName', 'title')
  end
end