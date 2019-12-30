class Piece < ApplicationRecord

  def horz?(piece, goal_x, goal_y)
    if piece.y_pos == goal_y && piece.x_pos != goal_x
      return true
    end
    return false
  end
  
  def vert?(piece, goal_x, goal_y)
    if piece.y_pos != goal_y && piece.x_pos == goal_x
      return true
    end
    return false
  end
  
  def diag?(piece, goal_x, goal_y)
    if piece.y_pos != goal_y && piece.x_pos != goal_x
      return true
    end
    return false
  end
  
  def invalid?(piece, goal_x, goal_y)
    dist_y = (goal_y - piece.y_pos).abs
    dist_x = (goal_x - piece.x_pos).abs
    if dist_x != dist_y
      return true
    end
    return false
  end
  
  def hor(piece, goal)
    dist = (goal - piece.x_pos).abs
    dist.times do |i|
      if goal > piece.x_pos
        if board[piece.y_pos][piece.x_pos + i] != 0
          return 'is obstructed'
        end
      else
        if board[piece.y_pos][piece.x_pos - i] != 0
          return 'is obstructed'
        end
      end
    end 
  end
  
  def vert(piece, goal)
    dist = (goal - piece.y_pos).abs
    dist.times do |i|
      if goal > piece.y_pos
        if board[piece.y_pos - i][piece.x_pos] != 0
          return 'is obstructed'
        end
      else
        if board[piece.y_pos + i][piece.x_pos] != 0
          return 'is obstructed'
        end
      end
    end
  end
    
  def diag (piece, goal_x, goal_y)
    dist_y = goal_y - piece.y_pos
    dist_x = goal_x - piece.x_pos
    dist_x.abs.times do |i|
      if dist_x < 0 && dist_y < 0
        if board[piece.y_pos - i][piece.x_pos - i] != 0
          return 'is obstructed'
        end
      elsif dist_x < 0 && dist_y > 0
        if board[piece.y_pos + i][piece.x_pos - i] != 0
          return 'is obstructed'
        end
      elsif dist_x > 0 && dist_y < 0
        if board[piece.y_pos - i][piece.x_pos + i] != 0
          return 'is obstructed'
        end
      else
        if board[piece.y_pos + i][piece.x_pos + i] != 0
          return 'is obstructed'
        end
      end
    end
  end
end