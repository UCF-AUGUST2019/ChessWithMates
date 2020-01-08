class Game < ApplicationRecord
  scope :available, -> { where(black_id: nil) }
  belongs_to :user, required: false
  has_many :pieces
  after_create :populate_board!

  def populate_board!
    # WHITE PIECES

    (1..8).each do |f|
      Pawn.create(x_pos: f, y_pos: 7, game_id: id, player_id: white_id)
    end

    [1,8].each do |f|
    	Rook.create(x_pos: f, y_pos: 8, game_id: id, player_id: white_id)
    end

    [2,7].each do |f|
    	Knight.create(x_pos: f, y_pos: 8, game_id: id, player_id: white_id)
    end

    [3,6].each do |f|
    	Bishop.create(x_pos: f, y_pos: 8, game_id: id, player_id: white_id)
    end

    King.create(x_pos: 4, y_pos: 8, game_id: id, player_id: white_id)


    Queen.create(x_pos: 5, y_pos: 8, game_id: id, player_id: white_id)

    # BLACK PIECES 

    (1..8).each do |f|
      Pawn.create(x_pos: f, y_pos: 2, game_id: id)
    end

    [1,8].each do |f|
    	Rook.create(x_pos: f, y_pos: 1, game_id: id)
    end

    [2,7].each do |f|
    	Knight.create(x_pos: f, y_pos: 1, game_id: id)
    end

    [3,6].each do |f|
    	Bishop.create(x_pos: f, y_pos: 1, game_id: id)
    end

    King.create(x_pos: 4, y_pos: 1, game_id: id)


    Queen.create(x_pos: 5, y_pos: 1, game_id: id)

  end

end
