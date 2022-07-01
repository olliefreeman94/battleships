class ShipList
  def initialize
    @ships = []
  end

  def add(ship)
    @ships << ship
  end

  def unplaced
    return @ships.filter_map do |ship|
      if ship.placed? == false
        "S" * ship.length
      end
    end
  end

  def place(length)
    @ships.each do |ship|
      if ship.length == length && ship.placed? == false
        ship.place
      end
    end
  end
end