require_relative 'board'

class MineSweeper
  attr_accessor :board, :in_play

  def initialize
    @board = Board.new
    @in_play = true
  end

  def play
    @board.render
    until over?
      play_turn
    end
  end

  def play_turn
    puts "Choose the coordinate"
    pos = gets.chomp.split(",").map(&:to_i)
    puts "Choose what to do: flag(f) or open(o)"
    to_do = gets.chomp

    if to_do == "o"
      @board[*pos].reveal
      if @board[*pos].value == "B"
        @in_play = false
        puts "You lose!"
      end
    elsif to_do == "f"
      @board[*pos].flag
    end
    @board.render
  end

  def over?
    @board.grid.each do |row|
      row.each do |tile|
        if(tile.value != "B" && tile.revealed == false)
          return false
        elsif (tile.value == "B" && tile.revealed == true)
          puts "You lose!"
          return true
        end
      end
    end
    true
  end
end

MineSweeper.new.play
