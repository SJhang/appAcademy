class Tile
  attr_accessor :value, :revealed

  def initialize(value = "O")
    @value = value
    @revealed = false
  end

  def display
    if @revealed
      return @value
    else
      return "$"
    end
  end

  def reveal
    @revealed = true
  end

end
