# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  def span 
    if self.empty? 
      return nil
    end
    sorted = self.sort 
    return sorted[-1] - sorted[0]
  end
  
  def average 
    if self.empty? 
      return nil
    end
    length = self.length 
    sum = self.sum 
    sum / length.to_f
  end
  
  def median 
    if self.empty? 
      return nil
    end
    length = self.length 
    sorted = self.sort
    mid = length / 2 
    if length.even? 
      first_half = sorted[mid-1]
      second_half = sorted[mid]
      return (first_half + second_half) / 2.0
    else
      return sorted[mid]
    end
  end
  
  def counts
    count_hash = Hash.new(0)
    self.each do |ele| 
      count_hash[ele] += 1
    end
    count_hash
  end
  
  def my_count(query) 
    count = 0 
    self.each do |ele| 
      if ele == query 
        count += 1 
      end
    end
    count
  end 
  
  def my_index(query) 
    self.each_with_index do |ele, idx| 
      if ele == query 
        return idx
      end
    end
    nil
  end 
  
  def my_uniq 
    unique = []
    self.each do |ele|
      if !unique.include?(ele)
        unique << ele
      end
    end
    unique
  end
  
  def my_transpose
    transposed = []
    count = 0 
    while count < self.length  do
      transposed << []
      count += 1
    end
    
    self.each_with_index do |outer_ele, i|
      outer_ele.each_with_index do |inner_ele, j|
        transposed[j][i] = inner_ele
      end
    end
    transposed
  end

end
