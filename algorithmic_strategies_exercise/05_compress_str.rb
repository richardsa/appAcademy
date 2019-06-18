# Write a method, compress_str(str), that accepts a string as an arg.
# The method should return a new str where streaks of consecutive characters are compressed.
# For example "aaabbc" is compressed to "3a2bc".
def compress_str(str) 
  solution = ''
  pos = 0 
  while pos < str.length
    counter = 1
    while str[pos] == str[pos+1] && pos+1 < str.length
      counter += 1
       pos += 1
    end
    if counter == 1 
      solution += str[pos]
    else
      solution += counter.to_s + str[pos]
    end
    pos += 1
  end

   
  solution
end


p compress_str("aaabbc")        # => "3a2bc"
p compress_str("xxyyyyzz")      # => "2x4y2z"
p compress_str("qqqqq")         # => "5q"
p compress_str("mississippi")   # => "mi2si2si2pi"
