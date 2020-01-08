class Pawn < Piece

	def move?(goal_x, goal_y)
    if self.has_moved == false
			if goal_x != self.x_pos
    		self.update(has_moved: true)
    		return (goal_x - self.x_pos).abs <= 1 && (goal_y - self.y_pos).abs <= 1 && goal_y < self.y_pos unless obstructed?(goal_x, goal_y)
    	else
				self.update(has_moved: true)
				return (goal_y - self.y_pos).abs <= 2 && goal_y < self.y_pos unless obstructed?(goal_x, goal_y)
			end
    else
    	if goal_x != self.x_pos
    		return (goal_x - self.x_pos).abs <= 1 && (goal_y - self.y_pos).abs <= 1 && goal_y < self.y_pos unless obstructed?(goal_x, goal_y)
	    else
	    	return (goal_y - self.y_pos).abs == 1 && goal_y < self.y_pos unless obstructed?(goal_x, goal_y)
	    end
	  end
    false
  end

end
