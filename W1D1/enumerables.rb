class Array
  def my_each(&block)
    i = 0
    return_array = []
    while i < self.length
      return_array << block.call(self[i])
      i += 1
    end
    self
  end

  def my_select(&block)
    return_array = []
    self.my_each do |i|
      if block.call(i)
          return_array << i
      end
    end
    return_array
  end
end

a = [1, 2, 3, 4, 5, 6]
a.my_select { |num| num > 1 }
a.my_select { |num| num == 4 }
a.my_select { |num| (num % 2) == 0 }



def my_select(&block)
  puts self.my_each { |b| b.block.call }
end
