FactoryBot.define do
  factory :king, class: Piece do
    type      {'King'}
    has_moved {false}
  end

  # factory :queen do
    
  # end

  # factory :bishop do
    
  # end

  # factory :knight do
    
  # end

  # factory :rook do
    
  # end

  factory :pawn, class: Piece do
    type      {'Pawn'}
    has_moved {false}
  end

  factory :user do
    sequence :email do |n|
      "dummyEmail#{n}@gmail.com"
    end
    password { "secretPassword" }
    password_confirmation { "secretPassword" }
  end

  factory :piece do
    x_pos      {4}
    y_pos      {4}
    game_id    {2}
    player_id  {1}
    captured   {false}
    type       {'Pawn'}
    has_moved  {false}
  end

  factory :game do
  	name { "random_name" }
  	white_id { 1 }
  	black_id { 2 }
  	association :user
  end
end