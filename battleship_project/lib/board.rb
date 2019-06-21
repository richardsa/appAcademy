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
end
