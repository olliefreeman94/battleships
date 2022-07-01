class Game
  def initialize(ship_list, board)
    @ship_list = ship_list
    @board = board
    @rows = @board.rows
    @cols = @board.cols
  end

  def unplaced_ships
    return @ship_list.unplaced
  end

  def rows
    return @rows
  end

  def cols
    return @cols
  end

  def board
    return @board.board
  end

  def place_ship(hash)
    length = hash[:length]
    @ship_list.place(length)

    x = hash[:col] - 1
    y = hash[:row] - 1
    if hash[:orientation] == :horizontal
      (1..length).map do
        @board.update("S", x, y)
        x += 1
      end
    elsif hash[:orientation] == :vertical
      (1..length).map do
        @board.update("S", x, y)
        y += 1
      end
    end
  end

  def ship_at?(x, y)
    return @board.board[y - 1][x - 1] == "S"
  end
end
