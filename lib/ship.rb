class Ship
  def initialize(length)
    @length = length
    @placed = false
  end

  def length
    return @length
  end

  def placed?
    return @placed
  end

  def place
    @placed = true
  end
end