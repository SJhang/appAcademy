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
      return "_"
    end
  end

  def reveal
    @revealed = true unless @flagged
  end

  def flag
    @flagged = !@flagged unless @revealed
  end
end
