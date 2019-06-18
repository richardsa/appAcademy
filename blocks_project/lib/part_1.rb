def select_even_nums(arr)
  arr.select(&:even?) 
end

def reject_puppies(arr)
  arr.reject {|pup| pup["age"] < 3 }
end

def count_positive_subarrays(arr) 
  arr.count {|ele| sum(ele) > 0}
end

def sum(arr)
  arr.inject(0){|sum,x| sum + x }
end

def aba_translate(str) 
  str.each_char.map { |char| aba(char) }.join("")
end

def aba(char)
  vowels = "aeiou"
  if vowels.include?(char)
    return char + "b" + char 
  else
    return char 
  end
end

def aba_array(arr) 
  arr.map { |word| aba_translate(word) }
end
