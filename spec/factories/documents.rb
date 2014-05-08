# Read about factories at https://github.com/thoughtbot/factory_girl
require 'lorem'

FactoryGirl.define do
  factory :document do
    sequence :name do |n|
      "My damn near fabulous document #: #{n}"
    end
    author

    sequence(:authors_upload_comments){|n| Lorem::Base.new(:paragraphs, n).output}
  end
end
