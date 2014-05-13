# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :review do
    review "MyText"
    reviewer_id 1
    document_id 1
  end
end
