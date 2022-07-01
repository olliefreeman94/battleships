class Board
  def initialize(rows, cols)
    @rows = rows
    @cols = cols
    @board = construct_board(rows, cols)
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

  def update(status, x, y)
    @board[y - 1][x - 1] = status
  end

  private

  def construct_board(rows, cols)
    return (1..rows).map { "." * cols }
  end
end