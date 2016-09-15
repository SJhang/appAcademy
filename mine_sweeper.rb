require_relative 'board'

class MineSweeper
  attr_accessor :board, :in_play

  def initialize
    @board = Board.new
    @in_play = true
  end

  def play
    @board.render
    while @in_play
      play_turn
    end
  end

  def play_turn
    puts "Choose the coordinate"
    pos = gets.chomp.split(",").map(&:to_i)
    @board[*pos].reveal
    @in_play = false if @board[*pos].value == "B"
    @board.render
  end

end

MineSweeper.new.play
