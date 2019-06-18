def caesar_cipher(str, n)
  alphabet = "abcdefghijklmnopqrstuvwxyz"
  len = alphabet.length 
  str.each_char.with_index do |char, idx|
    if alphabet.include?(char)
      puts alphabet.index(char) 
      puts n 
      puts len
      pos = (alphabet.index(char) + n + len) % len
      puts pos
      str[idx] = alphabet[pos]
    end
  end
  puts str
  str
end

caesar_cipher("whoa", 26)