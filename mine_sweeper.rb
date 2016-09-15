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
      @board.reveal(*pos)
    elsif to_do == "f"
      @board[*pos].flag
    end
    @board.render
  end

  def over?
    @board.over?
  end
end

MineSweeper.new.play
