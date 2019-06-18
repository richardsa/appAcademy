def all_words_capitalized?(arr)
  arr.all? { |word| word.capitalize == word }
end

def no_valid_url?(arr) 
  arr.none? { |url| valid_url?(url) }
end

def valid_url?(str)
  endings = ['com', 'net', 'io', 'org']
  arr = str.split('.')

  if arr.length != 2 
    return false 
  end 
  
  if endings.include?(arr[1])
    return true
  else 
    return false 
  end
end
  
def any_passing_students?(arr) 
  arr.any? { |student| is_passing?(student) }
end

def is_passing?(student)  
  average = grade(student[:grades])

  if average >= 75 
    return true 
  else 
    return false 
  end
end

def grade(arr)
  grades = arr.inject(0){|sum,x| sum + x }
  grades / arr.length.to_i
end
