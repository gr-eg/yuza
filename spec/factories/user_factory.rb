FactoryGirl.define do
  factory :user do
    username "gr-eg"
    sequence :email { |n| "user#{n}@example.com"}
    password :password
  end
end
