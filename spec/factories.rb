FactoryBot.define do
  factory :user do
    sequence :email do |n|
      "dummyEmail#{n}@gmail.com"
    end
    password { "secretPassword" }
    password_confirmation { "secretPassword" }
  end

  factory :piece, class: Piece do
    x_pos {4}
    y_pos {4}
    
  end
  
  factory :test, class: Piece do
    type {'is a test'}
  end
end