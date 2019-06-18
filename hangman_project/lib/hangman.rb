class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]
  
  def self.random_word
    DICTIONARY.sample
  end
  
 
  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length,) { '_' }
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end
  
  def guess_word 
    @guess_word
  end
  
  def attempted_chars
    @attempted_chars
  end
  
  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end
  
  def already_attempted?(guess)
    if @attempted_chars.include?(guess)
      return true 
    else 
      return false 
    end
  end
  
  def get_matching_indices(guess)
    indices = []
    if !@secret_word.include?(guess) 
      return indices
    end
    @secret_word.each_char.with_index do |char, idx|
      if guess == char 
        indices << idx
      end
    end
    indices
  end
  
  def fill_indices(char, indices)
    indices.each do |idx|
      @guess_word[idx] = char
    end
  end
  
  def try_guess(guess)
    if self.already_attempted?(guess)
      puts 'that has already been attempted'
      return false 
    end
    matched = get_matching_indices(guess)
    
    @attempted_chars << guess
    
    if matched == []
      @remaining_incorrect_guesses -= 1
    else
      fill_indices(guess, matched)
    end
      
    true
  end
  
  def ask_user_for_guess
    puts 'Enter a char:'
    guess = gets.chomp
    return try_guess(guess)
  end
  
  def win?
    if @guess_word.join('') == @secret_word
      puts "WIN"
      return true 
    else 
      return false
    end
  end
  
  def lose? 
    if @remaining_incorrect_guesses == 0 
      print 'LOSE'
      return true 
    else 
      return false 
    end
  end
  
  def game_over? 
    if self.win? || self.lose?
      print @secret_word 
      return true
    else 
      return false 
    end
    
  end
  
end
