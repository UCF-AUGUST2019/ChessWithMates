class Bishop < Piece

  def render
  	'fa fa-chess-bishop'
  end

  def move?(goal_x, goal_y)
    return (goal_x - x_pos).abs == (goal_y - y_pos).abs unless obstructed?(goal_x, goal_y)
    false
  end

end
