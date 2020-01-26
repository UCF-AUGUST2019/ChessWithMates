FactoryBot.define do
  factory :user do
    sequence :email do |n|
      "dummyEmail#{n}@gmail.com"
    end
    sequence :username do |n|
      "username#{n}"
    end
    password { "secretPassword" }
    password_confirmation { "secretPassword" }
  end

  factory :piece do
    x_pos      {4}
    y_pos      {4}
    game_id    {2}
    player_id  {game.white_id}
    captured   {false}
    has_moved  {false}
    color      {'White'}
  end

  factory :game do
  	name { "random_name" }
  	white_id { 1 }
    black_id { 2 }
    turn {1}
  	association :user
  end

end