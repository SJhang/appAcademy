require_relative 'tile'

class Board
  attr_accessor :grid

  def initialize
    @grid = Array.new (9) {Array.new(9) { Tile.new } }
  end

  def populate(number_of_bombs)
    positions = []
    @grid.each_with_index do |row,x|
      row.each_with_index do |col,y|
        positions << [x,y]
      end
    end

    bomb_pos = positions.sample(number_of_bombs)

    bomb_pos.each do |pos|
      self[*pos] = "B"
    end
  end

  def [](x,y)
    @grid[x][y]
  end

  def []=(x,y,new_value)
    @grid[x][y].value = new_value
  end
end

test = Board.new
test.populate(1)
p test.grid
