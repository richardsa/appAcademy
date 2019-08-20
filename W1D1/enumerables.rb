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

  def my_flatten(data = nil)
    data ||= self
    result = []
    if !data.is_a?(Array)
      result << data
    else
      data.my_each do |element|
        if element.is_a?(Array)
          result.push(*my_flatten(element))
        else
          result << element
        end
      end
    end
    result
  end

  def my_zip(*args)
  zipped = []
  iterator = 0
    self.my_each do |i|
      zipped_element = [i]
      args.my_each do |arg|
        if !arg[iterator].nil?
          zipped_element << arg[iterator]
        else
          zipped_element << nil
        end
      end
      iterator += 1
      zipped << zipped_element
    end
    zipped
  end

  def my_rotate(rotator = 1)
    pos = rotator % self.length
    rotated = []
    self.length.times do |i|
      if pos >= self.length
        pos = 0
      end
      rotated << self[pos]
      pos += 1
    end
    rotated
  end

  def my_join(separator = '')
    return_string = ''
    self.my_each do |i|
      return_string += i
      return_string += separator
    end
    return_string
  end

  def my_reverse()
    len = self.length - 1
    reversed = []
    until len < 0
      reversed << self[len]
      len -= 1
    end
    reversed
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
#[1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten  => [1, 2, 3, 4, 5, 6, 7, 8]
# def my_select(&block)
#   puts self.my_each { |b| b.block.call }
# end
# a = [ 4, 5, 6 ]
# b = [ 7, 8, 9 ]
# [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
# a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
# [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]
#
# c = [10, 11, 12]
# d = [13, 14, 15]
# [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]

# a = [ "a", "b", "c", "d" ]
# a.my_rotate         #=> ["b", "c", "d", "a"]
# a.my_rotate(2)      #=> ["c", "d", "a", "b"]
# a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
# a.my_rotate(15)     #=> ["d", "a", "b", "c"]

# a = [ "a", "b", "c", "d" ]
# a.my_join         # => "abcd"
# a.my_join("$")    # => "a$b$c$d"

[ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
[ 1 ].my_reverse               #=> [1]
