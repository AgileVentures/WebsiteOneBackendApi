FactoryBot.define do
  factory :project do
    title { 'Title of a project' }
    description { 'Description of a project' }
    status { 'Active' }
  end
end
