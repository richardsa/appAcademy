# Write a method, all_vowel_pairs, that takes in an array of words and returns all pairs of words
# that contain every vowel. Vowels are the letters a, e, i, o, u. A pair should have its two words
# in the same order as the original array.
#
# Example:
#
# all_vowel_pairs(["goat", "action", "tear", "impromptu", "tired", "europe"])   # => ["action europe", "tear impromptu"]
def all_vowel_pairs(words)
  vowels = {"a"=>1, "e"=>1, "i"=>1, "o"=>1, "u"=>1}
  solution = []
  words.each_with_index do |word, index|
    vowel_hash = get_vowels(word)
    i = index
    while i < words.length
      # make copy of original vowel hash
      temp_hash = vowel_hash.dup
      if get_vowels(words[i], temp_hash) == vowels
        solution <<  word + " " +  words[i]
        break
      end
      i += 1
    end
  end

  solution
end

def get_vowels(word, vowel_count = nil)
  vowels = "aeiou"
  vowel_count ||= (vowel_count = Hash.new(0))
  word.each_char do |ele|
    if vowels.include?(ele.downcase)
      if vowel_count[ele.downcase] == 0
        vowel_count[ele.downcase] += 1
      end
    end
  end
  vowel_count
end

# Write a method, composite?, that takes in a number and returns a boolean indicating if the number
# has factors besides 1 and itself
#
# Example:
#
# composite?(9)     # => true
# composite?(13)    # => false
def composite?(num)
  i = 2
  while i < num
    if num % i == 0
      return true
    end
    i += 1
  end
  false
end


# A bigram is a string containing two letters.
# Write a method, find_bigrams, that takes in a string and an array of bigrams.
# The method should return an array containing all bigrams found in the string.
# The found bigrams should be returned in the the order they appear in the original array.
#
# Examples:
#
# find_bigrams("the theater is empty", ["cy", "em", "ty", "ea", "oo"])  # => ["em", "ty", "ea"]
# find_bigrams("to the moon and back", ["ck", "oo", "ha", "at"])        # => ["ck", "oo"]
def find_bigrams(str, bigrams)
  solution = []

  bigrams.each do |ele|
    first = 0
    while first < str.length - 1
      last = first + 1
      if str[first..last] == ele
        solution << ele
        break
      end
      first += 1
    end

  end
  solution
end

class Hash
    # Write a method, Hash#my_select, that takes in an optional proc argument
    # The method should return a new hash containing the key-value pairs that return
    # true when passed into the proc.
    # If no proc is given, then return a new hash containing the pairs where the key is equal to the value.
    #
    # Examples:
    #
    # hash_1 = {x: 7, y: 1, z: 8}
    # hash_1.my_select { |k, v| v.odd? }          # => {x: 7, y: 1}
    #
    # hash_2 = {4=>4, 10=>11, 12=>3, 5=>6, 7=>8}
    # hash_2.my_select { |k, v| k + 1 == v }      # => {10=>11, 5=>6, 7=>8})
    # hash_2.my_select                            # => {4=>4}
    def my_select(&prc)
      prc ||= Proc.new { |k, v| k == v}
      solution = {}
      self.each do |k, v|
        if prc.call(k, v)
          solution[k] = v
        end
      end
      solution
    end
end

class String
    # Write a method, String#substrings, that takes in a optional length argument
    # The method should return an array of the substrings that have the given length.
    # If no length is given, return all substrings.
    #
    # Examples:
    #
    # "cats".substrings     # => ["c", "ca", "cat", "cats", "a", "at", "ats", "t", "ts", "s"]
    # "cats".substrings(2)  # => ["ca", "at", "ts"]
    def substrings(length = nil)
      solution = []
      if length
        beg = 0
        ending = beg + length
        while ending < self.length + 1
          solution << self[beg...ending]
          beg += 1
          ending += 1
        end
      else
        self.each_char.with_index do |letter, i|
          place = i + 1
          while place < self.length + 1
            solution << self[i...place]
            place += 1
          end
        end
      end
      solution
    end

    # Write a method, String#caesar_cipher, that takes in an a number.
    # The method should return a new string where each char of the original string is shifted
    # the given number of times in the alphabet.
    #
    # Examples:
    #
    # "apple".caesar_cipher(1)    #=> "bqqmf"
    # "bootcamp".caesar_cipher(2) #=> "dqqvecor"
    # "zebra".caesar_cipher(4)    #=> "difve"
    def caesar_cipher(num)
      alph = "abcdefghijklmnopqrstuvwxyz"
      last_index = alph.length - 1
      solution = ''
      self.each_char.with_index do |char, i|
        pos = alph.index(char)
        shifted_pos = pos + num
        if shifted_pos < last_index
          solution += alph[shifted_pos]
        else
          mod_pos = (shifted_pos % last_index) - 1
          solution += alph[mod_pos]
        end
      end
      solution
    end
end
