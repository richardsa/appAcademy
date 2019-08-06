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
    selected = []
    self.my_each do |i|
      if block.call(i)
          selected << i
      end
    end
    return_array
  end

  def my_reject(&block)
    rejected = []
    self.my_each do |i|
      if !block.call(i)
          rejected << i
      end
    end
    rejected
  end

  def my_any?(&block)
    self.my_each do |i|
      if block.call(i)
          return true
      end
    end
    false
  end

  def my_all?(&block)
    self.my_each do |i|
      if !block.call(i)
          return false
      end
    end
    true
  end

  def my_flatten()
    return [self] if !self.is_a?(Array)
    flattened = []
    self.my_each { |el| flattened += el.my_flatten }
    flattened
  end
end

# a = [1, 2, 3, 4, 5, 6]
# a.my_select { |num| num > 1 }
# a.my_select { |num| num == 4 }
# a.my_select { |num| (num % 2) == 0 }
# a = [1, 2, 3]
# a.my_reject { |num| num > 1 } # => [1]
# a.my_reject { |num| num == 4 } # => [1, 2, 3]
# a = [1, 2, 3]
# a.my_any? { |num| num > 1 } # => true
# a.my_any? { |num| num == 4 } # => false
# a.my_all? { |num| num > 1 } # => false
# a.my_all? { |num| num < 4 } # => true
[1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]
# def my_select(&block)
#   puts self.my_each { |b| b.block.call }
# end
