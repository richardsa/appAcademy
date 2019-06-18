def partition(arr, num)
  
  partioned = [[], []]
  
  arr.each do |ele|
    if ele < num 
      partioned[0] << ele 
    else 
      partioned[1] << ele 
    end
  end
  
  partioned
    
end

def merge(hash_1, hash_2)
  
  merged_hash = {}
  
  hash_1.each do |k, v|
    merged_hash[k] = v
  end
  
  hash_2.each do |k, v|
    merged_hash[k] = v
  end
  
  merged_hash
  
end

def censor(sent, arr)
  words = sent.split(" ")
  vowels = "aeiou"
 
  censored = words.map do |word|
    if arr.include?(word.downcase)
      word.each_char.with_index do |char, idx|
       if vowels.include?(char.downcase)
          word[idx] = '*'
       end
      end
      word
    else 
      word
    end
  end
  
  censored.join(" ")
  
end

def power_of_two?(num)
  
  if num <= 0
    return false 
  elsif num == 1 
    return true
  end
  
  acc = 1 
  
  while acc <= num 
    acc *= 2
    if acc == num 
     return true 
    end
  end
  
  false 
  
end
