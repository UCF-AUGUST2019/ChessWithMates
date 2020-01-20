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
      Pawn.create(x_pos: f, y_pos: 2, game_id: id, player_id: black_id)
    end

    [1,8].each do |f|
    	Rook.create(x_pos: f, y_pos: 1, game_id: id, player_id: black_id)
    end

    [2,7].each do |f|
    	Knight.create(x_pos: f, y_pos: 1, game_id: id, player_id: black_id)
    end

    [3,6].each do |f|
    	Bishop.create(x_pos: f, y_pos: 1, game_id: id, player_id: black_id)
    end

    King.create(x_pos: 4, y_pos: 1, game_id: id, player_id: black_id)


    Queen.create(x_pos: 5, y_pos: 1, game_id: id, player_id: black_id)

  end

  def stalemate(player_id)
    game.pieces.where(player_id: player_id) do |piece|
      (1..8).each do |goal_x|
        (1..8).each do |goal_y|
          if piece.move(goal_x, goal_y) && piece.check?(goal_x, goal_y) == false
            return true
          end
        end
      end
    end
  end


  def checkmate?(player_id)
    king = King.where(player_id: player_id)
    if king.check? && stalemate(player_id)
      return true
    end
  end

end
