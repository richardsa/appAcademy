# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

def largest_prime_factor(num)
  i = num - 1

  while i > 1 
    if is_prime?(i) && num % i == 0
     return i 
    end
    i -= 1
  end
  
  num
end

def is_prime?(num)
  return false if num < 2
  (2...num).each do |factor|
    if num % factor == 0
      return false
    end
  end
  true
end

def unique_chars?(str)
  chars = []
  str.each_char do |char|
    if chars.include?(char)
      return false
    end
    chars << char
  end
  true
end

def dupe_indices(arr)
  all_pos = Hash.new([])
  
  arr.each_with_index do |ele, idx|
    if all_pos.has_key?(ele)
      all_pos[ele] << idx
    else
      all_pos[ele] = [idx]
    end
  end
  
  filtered = {}
  all_pos.each do |k,v|
    if v.length > 1
      filtered[k] = v 
    end
  end
  return filtered
end

def ana_array(arr_1, arr_2)
  get_hash(arr_1) == get_hash(arr_2)
end

def get_hash(arr) 
  ret_hash = Hash.new(0)
  arr.each do |ele|
    ret_hash[ele] += 1
  end
  return ret_hash 
end
