class Game
  def initialize
    @all_ships = ["SSSSS", "SSSS", "SSS", "SSS", "SS"]
    @placed_ships = []
    @rows = 10
    @cols = 10
    @board = construct_board(@rows, @cols)
  end

  def unplaced_ships
    return @all_ships - @placed_ships
  end

  def rows
    return @rows
  end

  def cols
    return @cols
  end

  def board
    return @board
  end

  def place_ship(hash)
    length = hash[:length]
    ship = "S" * length
    @placed_ships << ship

    row = 10 - hash[:row]
    col = hash[:col] - 1
    if hash[:orientation] == :horizontal
      (1..length).map do
        @board[row][col] = "S"
        col += 1
      end
    elsif hash[:orientation] == :vertical
      (1..length).map do
        @board[row][col] = "S"
        row -= 1
      end
    end
  end

  def ship_at?(x, y)
    return @board[10 - y][x - 1] == "S"
  end

  private

  def construct_board(rows, cols)
    return (1..rows).map { "." * cols }
  end
end
