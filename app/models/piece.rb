class Piece < ApplicationRecord
  belongs_to :user, required: false
  belongs_to :game, required: false

  def horz?(goal_x, goal_y)
    y_pos == goal_y && x_pos != goal_x
  end
  
  def vert?(goal_x, goal_y)
    y_pos != goal_y && x_pos == goal_x
  end
  
  def diag?(goal_x, goal_y)
    (goal_y - y_pos).abs == (goal_x - x_pos).abs
  end
  
  def invalid?(goal_x, goal_y)
    dist_y = (goal_y - y_pos).abs
    dist_x = (goal_x - x_pos).abs
    if dist_x == 0 || dist_y == 0 
      return false
    elsif dist_x != dist_y
      return true
    end
    return false
  end
  
  def hor(goal_x, goal_y)
    dist = (goal_x - x_pos).abs
    (1..dist-1).each do |i|
      if goal_x > x_pos
        return true if Piece.where(x_pos: x_pos + i, y_pos: goal_y, game_id: game_id).count != 0 
      else
        return true if Piece.where(x_pos: x_pos - i, y_pos: goal_y, game_id: game_id).count != 0 
      end
    end
    false 
  end
  
  def vert(goal_x, goal_y)
    dist = (goal_y - y_pos).abs
    (1..dist-1).each do |i|
      if goal_y > y_pos
        return true if Piece.where(x_pos: goal_x, y_pos: y_pos + i, game_id: game_id).count != 0
      else
        return true if Piece.where(x_pos: goal_x, y_pos: y_pos - i, game_id: game_id).count != 0
      end
    end
    false
  end
    
  def diag (goal_x, goal_y)
    dist_y = goal_y - y_pos
    dist_x = goal_x - x_pos
    (1..dist_x.abs-1).each do |i|
      dir_x = dist_x < 0 ? -1 : 1
      dir_y = dist_y < 0 ? -1 : 1
      return true if Piece.where(x_pos: x_pos + (i * dir_x), y_pos: y_pos + (i * dir_y), game_id: game_id).present?
    end
    false
  end

  def obstructed?(goal_x, goal_y)
    return "Invalid choice. Please choose again" unless horz?(goal_x, goal_y) || vert?(goal_x, goal_y) || diag?(goal_x, goal_y)
    
    return hor(goal_x, goal_y) if horz?(goal_x, goal_y)
      
    return vert(goal_x, goal_y) if vert?(goal_x, goal_y)
      
    return diag(goal_x, goal_y) if diag?(goal_x, goal_y)
    
  end

  def in_check_after_move?
    return true if Piece.find_by(game_id: game_id, color: self.color, type: 'King').check?
    false
  end

  def move(goal_x, goal_y)
    if can_move? 
    # we keep the current position in case the move is invalid
      current_x = x_pos
      current_y = y_pos
      current__moves = num_moves
      # we check if the goal has a piece that's occupied by an opposing piece
      op_color = color == 'White' ? 'Black' : 'White'
      op_piece = Piece.find_by(x_pos: goal_x, y_pos: goal_y, color: op_color)
      op_piece == nil ? op_piece = false : op_piece

      if move?(goal_x, goal_y)
        update_attributes(x_pos: goal_x, y_pos: goal_y, num_moves: num_moves + 1)
        op_piece.capture if op_piece
        game.update_attributes(turn: game.turn + 1)
      else
        return 'Invalid move. Try again: '
      end
    
      if in_check_after_move?
        update_attributes(x_pos: current_x, y_pos: current_y, num_moves: current__moves)
        op_piece.update_attributes(captured: false) if op_piece
        return 'Invalid move. King still in check: '
      end
      update_attributes(has_moved: true) if has_moved == false
      true
    else
      return 'Please wait for your turn.'
    end
  end
  
  # call capture on the piece to be captured.
  def capture
    self.update_attributes(captured: true)
  end

  def can_move?
    return true if game.turn.odd? && player_id == game.white_id
    return true if game.turn.even? && player_id == game.black_id
    false
  end

end
