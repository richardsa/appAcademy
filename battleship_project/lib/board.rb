class Board
  attr_reader :size
  def initialize(n)
    @grid =  Array.new(n, :N) { Array.new(n, :N) }
    @size = n * n
  end

  def [](pos)
    @grid[pos[0]][pos[1]]
  end
end
