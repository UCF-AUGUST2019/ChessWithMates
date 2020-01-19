class King < Piece

  def move?(goal_x, goal_y)
    return (goal_x - self.x_pos).abs <= 1 && (goal_y - self.y_pos).abs <= 1 unless obstructed?(goal_x, goal_y)
    false
  end

  def render
  	'fa fa-chess-king'
  end

  def check?
    if self.color == 'Black'
      Piece.find_by(game_id: game_id, color: 'White').move(x_pos, y_pos)
    else
      Piece.find_by(game_id: game_id, color: 'Black').move(x_pos, y_pos)
    end
  end
end
