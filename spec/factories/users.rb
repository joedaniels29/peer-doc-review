# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user, :aliases => [:reviewer, :author] do
    sequence :name do |n|
      "John Doe no. #{n}"
    end
    sequence :email do |n|
      "email#{n}@example.com"
    end
    sequence :username do |n|
      "johnDoe#{n}"
    end
    sequence :password do |p|
        "!t'sAsuperSecret#{p}"
    end
    password_confirmation { |u| u.password }


    # user_with_posts will create post data after the user has been created
    factory :user_with_docs do
      # posts_count is declared as an ignored attribute and available in
      # attributes on the factory, as well as the callback via the evaluator
      ignore do
        number_of_docs 5
      end

      # the after(:create) yields two values; the user instance itself and the
      # evaluator, which stores all values from the factory, including ignored
      # attributes; `create_list`'s second argument is the number of records
      # to create and we make sure the user is associated properly to the post
      after(:create) do |user, evaluator|
        create_list(:document, evaluator.number_of_docs, author: user)
        user.reload
      end
    end
  end
end
