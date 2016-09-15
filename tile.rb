class Tile
  attr_accessor :value, :revealed, :flagged

  def initialize(value = "O")
    @value = value
    @revealed = false
    @flagged = false
  end

  def display
    if @revealed
      return @value
    elsif @flagged
      return "F"
    else
      return "$"
    end
  end

  def reveal
    @revealed = true
  end

  def flag
    @flagged = true
  end
end
