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

    result = @grid[pos[0]][pos[1]]
    #result = @grid.[]([pos[0]][pos[1]])
    if   result == :S
      @grid[pos[0]][pos[1]] = :H
      puts 'you sunk my battleship!'
      return true
    else
        @grid[pos[0]][pos[1]] = :X
        return false
    end

  end
end
