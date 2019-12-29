class Obstructed

  def add(x, y)
    return x + y
  end

  # CHECKS TO SEE IF SQUARE HAS A PIECE IN IT:
  def occupied? (x, y)
    pieces.each do |piece|
      if piece.x_pos == x && piece.y_pos == y
        return true
      end
    end
  end
  
  # CHECKS THE PATH OF DESIRED MOVE HORZ:VERT:DIAG:
  def check_path(x1, y1, x2, y2)
    if y1 == y2
      return 'horizontal'
    elsif x1 == x2
      return 'vertical'
    else
      # !diagonal
      @slope = (y2 - y1).to_f / (x2 - x1).to_f
    end
  end
  
  # DETERMINES WHETHER THE PATH BETWEEN THE CURRENT PIECE AND THE INTENDED DESTINATION IS OBSTRUCTED BY ANOTHER PIECE:
  # ?[DESTINATION] = ARRAY CONTAINING X AND Y COORDS OF PIECE'S INTENDED DESTINATION
  def obstructed?(destination)
    # !converts location arrays into x & y terms
    x1 = self.x_pos
    y1 = self.y_pos
    x2 = destination[0]
    y2 = destination[1]
  
    path = check_path(x1, y1, x2, y2)
  
  end
end
