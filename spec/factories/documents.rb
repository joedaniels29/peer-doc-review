# Read about factories at https://github.com/thoughtbot/factory_girl
require 'lorem'
include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :document do
    sequence :name do |n|
      "My damn near fabulous document #: #{n}"
    end
    author

    factory :document_with_file do
      file { fixture_file_upload(Dir[Rails.root.join('spec', "factories", "files/*")].sample)}
    end

    factory :document_with_text_content do
      sequence(:content){|n| Lorem::Base.new(:paragraphs, n+10).output}
    end



    sequence(:authors_upload_comments){|n| Lorem::Base.new(:paragraphs, n).output}
  end
end
