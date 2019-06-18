class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }
  attr_accessor :pegs 
  
  def initialize(pegs)
    if Code::valid_pegs?(pegs)
      @pegs = pegs.map { |ele| ele.upcase }
    else
      raise "invalid pegs brutha"
    end
  end
  
  def self.valid_pegs?(pegs)
    puts pegs
    pegs.each do |peg|
      if !POSSIBLE_PEGS.has_key?(peg.upcase)
        return false
      end
    end
    true
  end
  
  def self.get_keys(dict)
    arr = []
    dict.each do |k,v|
      arr << k
    end
    arr
  end
  
  def self.random(len)
    puts len
    pegs = get_keys(POSSIBLE_PEGS)
    puts pegs
    random_pegs = []
    
    len.to_i.times do 
     random_pegs << pegs[rand(pegs.length-1)]
    end
    
    Code.new(random_pegs)
  end
  
  def self.from_string(pegs)
    pegs = pegs.split('')
    Code.new(pegs)
  end
  
  def [](position)
    @pegs[position]
  end
  
  def length
    @pegs.length
  end

  def num_exact_matches(guess)
    count = 0
    @pegs.each_with_index do |peg, index|
      if peg == guess.pegs[index]
        count += 1
      end
    end
    count
  end
  
  def num_near_matches(guess)
    
  end
end

