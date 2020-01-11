class Queen < Piece
  # can move horz, vert & diag 1-7 spaces until obstructed
  # if obstructed by same team = can't continue
  # if obstructed by enemy team = capture

  def move?(goal_x, goal_y)
    return (horz?(goal_x, goal_y) || vert?(goal_x, goal_y)) || diag?(goal_x, goal_y) && !obstructed?(goal_x, goal_y)
  end
end
