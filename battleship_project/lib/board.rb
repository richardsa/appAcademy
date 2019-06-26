class Board
  attr_reader :size
  def initialize(n)
    @grid =  Array.new(n, :N) { Array.new(n, :N) }
    @size = n * n
  end

  def [](pos)
    @grid[pos[0]][pos[1]]
  end

  def []=(pos, val)
    @grid[pos[0]][pos[1]] = val
  end

  def num_ships
    ending = Integer.sqrt(@size)
    count = 0
    (0...ending).each do |i|
      (0...ending).each do |j|
        if @grid[i][j] == :S
          count += 1
        end
      end
    end
    count
  end

  def attack(pos)
    # board[pos] = :S       # this line...
    # board.[]=(pos, :S)    # is same as this line. :)
    # expect(board).to receive(:[])
    # expect(board).to receive(:[]=)
    # board.attack([2, 4])
    # result = @grid[pos[0]][pos[1]]
    # #result = @grid.[]([pos[0]][pos[1]])
    # if result == :S
    #   @grid[pos[0]][pos[1]] = :H
    #   puts 'you sunk my battleship!'
    #   return true
    # else
    #     @grid[pos[0]][pos[1]] = :X
    #     return false
    # end
    if self[pos] == :S
      self[pos] = :H
      puts "you sunk my battleship!"
      return true
    else
      self[pos] = :X
      return false
    end
  end

  def place_random_ships()
    ending = Integer.sqrt(@size)
    ships = []
    (0...ending).each do |i|
      (0...ending).each do |j|
        ships << [i,j]
      end
    end
    ships = ships.sample(@size/4)
    ships.each do |ship|
      @grid[ship[0]][ship[1]] = :S
    end
  end

  def hidden_ships_grid()
    hidden_grid =  @grid.map(&:clone)
    ending = Integer.sqrt(@size)
    count = 0
    (0...ending).each do |i|
      (0...ending).each do |j|
        if hidden_grid[i][j] == :S
          hidden_grid[i][j] = :N
        end
      end
    end
    hidden_grid
  end

  def self.print_grid(grid)
    grid.each do |ele|
      print ele.join(' ')
      puts
    end
  end

  def cheat
    Board.print_grid(@grid)
  end

  def print
    Board.print_grid(hidden_ships_grid)
  end
end
