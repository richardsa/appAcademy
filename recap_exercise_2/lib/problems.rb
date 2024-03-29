# Write a method, least_common_multiple, that takes in two numbers and returns the smallest number that is a mutiple
# of both of the given numbers
def least_common_multiple(num_1, num_2)
  found = false
  i = 1
  until found
    multiple = num_1 * i
    if multiple % num_2 == 0
      return multiple
    end
    i += 1
  end
end



# Write a method, most_frequent_bigram, that takes in a string and returns the two adjacent letters that appear the
# most in the string.
def most_frequent_bigram(str)
  bigramHash = Hash.new(0)
  (0...str.length-1).each do |i|
    bigram = str[i..i+1]
    bigramHash[bigram] += 1
  end
  return bigramHash.key(bigramHash.values.max)
end


class Hash
    # Write a method, Hash#inverse, that returns a new hash where the key-value pairs are swapped
    def inverse
      solution = {}
      self.each do |k, v|
        solution[v] = k
      end
      return solution
    end
end


class Array
    # Write a method, Array#pair_sum_count, that takes in a target number returns the number of pairs of elements that sum to the given target
    def pair_sum_count(num)
      count = 0
      self.each.with_index do |ele, i|
        j = i + 1
        (j...self.length).each do |x|
          if self[i] + self[x] == num
            count += 1
          end
        end
      end
      return count
    end


    # Write a method, Array#bubble_sort, that takes in an optional proc argument.
    # When given a proc, the method should sort the array according to the proc.
    # When no proc is given, the method should sort the array in increasing order.
    def bubble_sort(&prc)
      if prc
        swapped = true
        while swapped do
          swapped = false
          (self.length - 1).times do |i|
           if prc.call(self[i], self[i + 1]) == 1
             self[i], self[i + 1] = self[i + 1], self[i]
             swapped = true
           end
         end
        end
          return self
        end

      else
        return self.sort!
      end
    end
