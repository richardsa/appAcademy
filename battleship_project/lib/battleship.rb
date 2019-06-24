require_relative "board"
require_relative "player"

class Battleship
  def initialize(n)
    @player = Player.new()
    @board = Board.new(n)
    @remaining_misses = (n*n)/2
  end

  def board
    @board
  end

  def player
    @player
  end

  def start_game
    @board.place_random_ships
    puts "number of ships: #{@board.num_ships}"
    @board.print
  end
end
