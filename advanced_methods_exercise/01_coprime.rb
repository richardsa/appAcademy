# Write a method, coprime?(num_1, num_2), that accepts two numbers as args.
# The method should return true if the only common divisor between the two numbers is 1.
# The method should return false otherwise. For example coprime?(25, 12) is true because
# 1 is the only number that divides both 25 and 12.
def coprime?(num_1, num_2)
  if shared(divisors(num_1), divisors(num_2))
    return false 
  else 
    return true 
  end
end


# get array of all divisors for given number
def divisors(num)
  i = 2
  div = []
  while i <= num 
    if num % i == 0 
      div << i 
    end
    i += 1
  end
  return div
end

# see if arrays contain shared values
def shared(arr_1, arr_2)
  arr_1.each do |ele|
    if arr_2.include?(ele)
      return true 
    end
  end
  arr_2.each do |ele|
    if arr_1.include?(ele)
      return true 
    end
  end
  return false
end


p coprime?(25, 12)    # => true
p coprime?(7, 11)     # => true
p coprime?(30, 9)     # => false
p coprime?(6, 24)     # => false
