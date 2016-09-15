class Tile
  attr_accessor :value, :revealed

  def initialize(value = "O")
    @value = value
    @revealed = true
  end

  def display
    if @revealed
      return @value
    else
      return "$"
    end
  end

end
