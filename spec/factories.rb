FactoryBot.define do
  factory :user do
    sequence :email do |n|
      "dummyEmail#{n}@gmail.com"
    end
    password { "secretPassword" }
    password_confirmation { "secretPassword" }
  end

  factory :game do
  	name { "random_name" }
  	white_id { 1 }
  	black_id { 2 }
  	association :user
  end
end