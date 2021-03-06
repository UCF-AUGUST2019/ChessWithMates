class Rook < Piece

  def move?(goal_x, goal_y)
    return (horz?(goal_x, goal_y) || vert?(goal_x, goal_y)) && !obstructed?(goal_x, goal_y)
  end
  
  def render
    'fa fa-chess-rook'
  end
end
