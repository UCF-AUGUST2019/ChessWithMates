class Pawn < Piece
	
	def move?(goal_x, goal_y)
    # First we check if the pawn has moved
    if self.has_moved == false
			# The first move for the pawn doesn't have to move it 2 spaces
			# and we check if it's moving diagonally for an attack. Either
			# way we set has_moved to true so it can only move 1 space from now on
			if goal_x != self.x_pos
    		self.update(has_moved: true)
    		return (goal_x - self.x_pos).abs <= 1 && (goal_y - self.y_pos).abs <= 1 && goal_y < self.y_pos unless obstructed?(goal_x, goal_y)
    	else
				self.update(has_moved: true)
				return (goal_y - self.y_pos).abs <= 2 && goal_y < self.y_pos unless obstructed?(goal_x, goal_y)
			end
    else
    	# Standard pawn movement where we check that it's moving in
    	# the correct direction and only one space at a time.
    	if goal_x != self.x_pos
    		return (goal_x - self.x_pos).abs <= 1 && (goal_y - self.y_pos).abs <= 1 && goal_y < self.y_pos unless obstructed?(goal_x, goal_y)
	    else
	    	return (goal_y - self.y_pos).abs == 1 && goal_y < self.y_pos unless obstructed?(goal_x, goal_y)
	    end
	  end
    false
  end

  def render
  	'fa fa-chess-pawn'
  end
  
  # pawns can promote when they make it to the other
  # player's starting area
  # will have to add js for a dropdown of possible pieces
  def promote(newType)
    # we check that the y_pos is 1 or 8 because
    # a pawn should only be able to be there legally
    # by crossing the board
    if self.y_pos == 1 || self.y_pos == 8
      # sets the type of the pawn to what's entered by the user
      self.update(type: newType)
    end
  end
end
