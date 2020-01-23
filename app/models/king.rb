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
      Piece.where(game_id: game_id, color: 'White').each do |piece|
      	return true if piece.move?(x_pos, y_pos)
      end
    else
      Piece.where(game_id: game_id, color: 'Black').each do |piece|
      	return true if piece.move?(x_pos, y_pos)
      end
    end
    false
  end

  def castle(rook_x, rook_y)
  	return 'Cannot castle while in check' if self.check?
  	k_start_x = x_pos
  	k_start_y = y_pos
  	dist = rook_x - x_pos
  	direction = dist < 0 ? -1 : 1
  	rook = Piece.find_by(x_pos: rook_x, y_pos: rook_y)
  	if self.has_moved == false && rook.has_moved == false && obstructed?(rook_x, rook_y) == false
  		2.times do |i|
  			self.update_attributes(x_pos: k_start_x + ((i + 1)*direction), y_pos: rook_y)
  			if self.check?
  				self.update_attributes(x_pos: k_start_x, y_pos: k_start_y)
  				return 'Cannot castle through, or into check'
  			end
  		end
  		rook.update_attributes(x_pos: rook_x + (dist * direction) - 2, y_pos: rook_y, has_moved: true)
  	end
  end
end
