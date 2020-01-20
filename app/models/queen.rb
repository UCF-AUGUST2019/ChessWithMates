class Queen < Piece
  
  def move?(goal_x, goal_y)
    return (horz?(goal_x, goal_y) || vert?(goal_x, goal_y)) || diag?(goal_x, goal_y) unless obstructed?(goal_x, goal_y)
    false
  end

  def render
    'fa fa-chess-queen'
  end
end
