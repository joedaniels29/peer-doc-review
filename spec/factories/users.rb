# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
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

  end
end
