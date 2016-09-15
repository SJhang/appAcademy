require_relative 'tile'
require 'byebug'

class Board
  attr_accessor :grid
  DIRECTIONS = [[1,1],[0,1],[1,0],[-1,0],[0,-1],[-1,-1],[-1,1],[1,-1]]

  def initialize
    @width = 9
    @length = 9
    @grid = Array.new (@width) {Array.new(@length) { Tile.new } }
    populate_bombs(20)
    populate_numbers
  end

  def populate_bombs(number_of_bombs)
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

  def populate_numbers
    @grid.each_with_index do |row,x|
      row.each_with_index do |col,y|
        self[x,y] = count_adjacent_bombs(x,y) unless self[x,y].value == "B"
      end
    end
  end

  def count_adjacent_bombs(row, col)
    count = 0

    DIRECTIONS.each do |dir|
      x,y = dir[0]+row,dir[1]+col
      if within_board?(x,y)
        count += check_direction(dir[0]+row, dir[1]+col)
      end
    end
    count
  end

  def check_direction(row,col)
    return 1 if self[row,col].value == "B"
    return 0
  end

  def within_board?(row,col)
    row >= 0 &&
    col >= 0 &&
    row < @width &&
    col < @length
  end

  def [](x,y)
    @grid[x][y]
  end

  def []=(x,y,new_value)
    @grid[x][y].value = new_value
  end

  def render
    @grid.each do |row|
      row_string = ""
      row.each do |tile|
        row_string << " #{tile.display} "
      end
      puts row_string
    end
  end

end
