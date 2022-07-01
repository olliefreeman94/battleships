$LOAD_PATH << "lib"
require "game"
require "ship_list"
require "ship"
require "board"
require "user_interface"

class TerminalIO
  def gets
    return Kernel.gets
  end

  def puts(message)
    Kernel.puts(message)
  end
end

io = TerminalIO.new
list = ShipList.new
list.add( Ship.new(5) )
list.add( Ship.new(4) )
list.add( Ship.new(3) )
list.add( Ship.new(2) )
board = Board.new(10, 10)
game = Game.new(list, board)
user_interface = UserInterface.new(io, game)
user_interface.run
