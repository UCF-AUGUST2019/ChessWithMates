class Knight < Piece

  def render
  	'fa fa-chess-knight'
  end

  def move?(goal_x, goal_y)
    return (goal_x - x_pos).abs == 1 && (goal_y - y_pos).abs == 2 || (goal_x - x_pos).abs == 2 && (goal_y - y_pos).abs == 1
  end
end
