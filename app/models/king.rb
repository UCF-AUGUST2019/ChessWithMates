class King < Piece

  def move?(goal_x, goal_y)
    return (goal_x - self.x_pos).abs <= 1 && (goal_y - self.y_pos).abs <= 1 unless obstructed?(goal_x, goal_y)
    false
  end

  def render
  	'fa fa-chess-king'
  end

  # Tyler's advice:
  # I would think finding Piece.where(game_id: game_id, color: opposite_color) and 
  # then call valid_move? with coords to king position would be a good way to do that

  def check?
    if self.color == 'Black'
      Piece.find_by(game_id: game_id, color: 'White').move(x_pos, y_pos)
    else
      Piece.find_by(game_id: game_id, color: 'Black').move(x_pos, y_pos)
    end
  end

  # Ignore all this please!
  # def diag_check(i)
		# checkThreats = []
		# if i == 1
		# 	if Piece.where(x_pos: self.x_pos + i, y_pos: self.y_pos + i, player_id: !self.player_id, type: 'Pawn' || 'King' || 'Bishop' || 'Queen')
		# 		checkThreats << Piece.id unless obstructed?(self.x_pos + i, self.y_pos + i)
		# 	elsif Piece.where(x_pos: self.x_pos - i, y_pos: self.y_pos + i, player_id: !self.player_id, type: 'Pawn' || 'King' || 'Bishop' || 'Queen')
		# 		checkThreats << Piece.id unless obstructed?(self.x_pos - i, self.y_pos + i)
		# 	elsif Piece.where(x_pos: self.x_pos + i, y_pos: self.y_pos - i, player_id: !self.player_id, type: 'King' || 'Bishop' || 'Queen')
		# 		checkThreats << Piece.id unless obstructed?(self.x_pos + i, self.y_pos - i)
		# 	elsif Piece.where(x_pos: self.x_pos - i, y_pos: self.y_pos - i, player_id: !self.player_id, type: 'King' || 'Bishop' || 'Queen')
		# 		checkThreats << Piece.id unless obstructed?(self.x_pos - i, self.y_pos - i)
		# 	end
		# else
		# 	if Piece.where(x_pos: self.x_pos + i, y_pos: self.y_pos + i, player_id: !self.player_id, type: 'Bishop' || 'Queen')
		# 		checkThreats << Piece.id unless obstructed?(self.x_pos + i, self.y_pos + i)
		# 	elsif Piece.where(x_pos: self.x_pos - i, y_pos: self.y_pos + i, player_id: !self.player_id, type: 'Bishop' || 'Queen')
		# 		checkThreats << Piece.id unless obstructed?(self.x_pos - i, self.y_pos + i)
		# 	elsif Piece.where(x_pos: self.x_pos + i, y_pos: self.y_pos - i, player_id: !self.player_id, type: 'Bishop' || 'Queen')
		# 		checkThreats << Piece.id unless obstructed?(self.x_pos + i, self.y_pos - i)
		# 	elsif Piece.where(x_pos: self.x_pos - i, y_pos: self.y_pos - i, player_id: !self.player_id, type: 'Bishop' || 'Queen')
		# 		checkThreats << Piece.id unless obstructed?(self.x_pos - i, self.y_pos - i)
		# 	end
		# end
		# return checkThreats
  # end

  # def hor_check(i)
  # 	checkThreats = []
  # 	if i == 1
		# 	if Piece.where(x_pos: self.x_pos + i, y_pos: self.y_pos, player_id: !self.player_id, type: 'King' || 'Rook' || 'Queen')
		# 		checkThreats << Piece.id unless obstructed?(self.x_pos + i, self.y_pos)
		# 	elsif Piece.where(x_pos: self.x_pos - i, y_pos: self.y_pos, player_id: !self.player_id, type: 'King' || 'Rook' || 'Queen')
		# 		checkThreats << Piece.id unless obstructed?(self.x_pos - i, self.y_pos)
		# 	end
		# else
		# 	if Piece.where(x_pos: self.x_pos + i, y_pos: self.y_pos, player_id: !self.player_id, type: 'Rook' || 'Queen')
		# 		checkThreats << Piece.id unless obstructed?(self.x_pos + i, self.y_pos)
		# 	elsif Piece.where(x_pos: self.x_pos - i, y_pos: self.y_pos, player_id: !self.player_id, type: 'Rook' || 'Queen')
		# 		checkThreats << Piece.id unless obstructed?(self.x_pos - i, self.y_pos)
		# 	end
		# end
		# return checkThreats
  # end

  # def vert_check(i)
  # 	checkThreats = []
  # 	if i == 1
		# 	if Piece.where(x_pos: self.x_pos, y_pos: self.y_pos + i, player_id: !self.player_id, type: 'King' || 'Rook' || 'Queen')
		# 		checkThreats << Piece.id unless obstructed?(self.x_pos, self.y_pos + i)
		# 	elsif Piece.where(x_pos: self.x_pos, y_pos: self.y_pos - i, player_id: !self.player_id, type: 'King' || 'Rook' || 'Queen')
		# 		checkThreats << Piece.id unless obstructed?(self.x_pos, self.y_pos + i)
		# 	end
		# else
		# 	if Piece.where(x_pos: self.x_pos, y_pos: self.y_pos + i, player_id: !self.player_id, type: 'Rook' || 'Queen')
		# 		checkThreats << Piece.id unless obstructed?(self.x_pos, self.y_pos + i)
		# 	elsif Piece.where(x_pos: self.x_pos, y_pos: self.y_pos - i, player_id: !self.player_id, type: 'Rook' || 'Queen')
		# 		checkThreats << Piece.id unless obstructed?(self.x_pos, self.y_pos - i)
		# 	end
		# end
		# return checkThreats
  # end

  # def knight_check
  # 	checkThreats = []
  # 	if Piece.where(x_pos: self.x_pos + 1, y_pos: self.y_pos + 2, player_id: !self.player_id, type: 'Knight')
  # 		checkThreats << Piece.id
  # 	elsif Piece.where(x_pos: self.x_pos + 1, y_pos: self.y_pos - 2, player_id: !self.player_id, type: 'Knight')
  # 		checkThreats << Piece.id
  # 	elsif Piece.where(x_pos: self.x_pos - 1, y_pos: self.y_pos + 2, player_id: !self.player_id, type: 'Knight')
  # 		checkThreats << Piece.id
  # 	elsif Piece.where(x_pos: self.x_pos - 1, y_pos: self.y_pos - 2, player_id: !self.player_id, type: 'Knight')
  # 		checkThreats << Piece.id
  # 	elsif Piece.where(x_pos: self.x_pos + 2, y_pos: self.y_pos + 1, player_id: !self.player_id, type: 'Knight')
  # 		checkThreats << Piece.id
		# elsif Piece.where(x_pos: self.x_pos - 2, y_pos: self.y_pos + 1, player_id: !self.player_id, type: 'Knight')
  # 		checkThreats << Piece.id
		# elsif Piece.where(x_pos: self.x_pos - 2, y_pos: self.y_pos - 1, player_id: !self.player_id, type: 'Knight')
  # 		checkThreats << Piece.id
		# elsif Piece.where(x_pos: self.x_pos + 2, y_pos: self.y_pos - 1, player_id: !self.player_id, type: 'Knight')
  # 		checkThreats << Piece.id
  # 	end
  # 	return checkThreats
  # end

  # def check?
  # 	# create an array of pieces threatening check
  # 	checkThreats = []
  # 	# diag
  # 	(8-self.x_pos).times do |i|
  # 		checkThreats << self.diag_check(i)
  # 	end
  # 	(self.x_pos - 1).times do |i|
  # 		checkThreats << self.diag_check(i)
  # 	end
		# # hor
		# (8-self.x_pos).times do |i|
		# 	checkThreats << self.hor_check(i)
		# end
		# (8-self.x_pos).times do |i|
		# 	checkThreats << self.hor_check(i)
		# end
		# (8-self.y_pos).times do |i|
		# 	checkThreats << self.vert_check(i)
		# end
		# (8-self.y_pos).times do |i|
		# 	checkThreats << self.vert_check(i)
		# end
		# # knights
		# checkThreats << knight_check
		# # if checkThreats has any value in it, the King is in check
		# return true if checkThreats.length > 0
  # 	false
  # end

end
