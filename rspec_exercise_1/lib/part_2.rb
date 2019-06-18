def hipsterfy(str)
  vowels = "aeiou"
  i = str.length - 1
  while i >= 0 
    if vowels.include?(str[i])
      str[i] = ''
      return str
    end
    i -= 1
  end
  
  str
end

def vowel_counts(str)
  vowels = "aeiou"
  vowel_count = Hash.new(0)
  str.each_char do |ele|
    if vowels.include?(ele.downcase)
      vowel_count[ele.downcase] += 1
    end
  end
  vowel_count
end

def caesar_cipher(str, n)
  alphabet = "abcdefghijklmnopqrstuvwxyz"
  len = alphabet.length
  str.each_char.with_index do |char, idx|
    if alphabet.include?(char)
      pos = (alphabet.index(char) + n + len) % len
      str[idx] = alphabet[pos]
    end
  end
  str
end

 