def palindrome?(str)
  i = str.length - 1
  rev_str = ""
  while i >= 0 
    rev_str += str[i]
    i -= 1
  end
  str == rev_str
end

def substrings(str)
  i = 0
  sub_arr = []
  while i < str.length
    sub_arr << str[i]
    j = i + 1
    while j < str.length 
      sub_arr << str[i..j]
      j += 1
    end
    i += 1
  end
  sub_arr
end

def palindrome_substrings(str)
  sub_arr = substrings(str)
  sub_pal = []
  sub_arr.each do |ele|
    if ele.length > 1 && palindrome?(ele)
     sub_pal << ele
    end
  end
  sub_pal
end
