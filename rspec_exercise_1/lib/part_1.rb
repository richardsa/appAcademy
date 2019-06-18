def average(num1, num2) 
  (num1 + num2) / 2.0
end

def average_array(arr)
  arr_sum = arr.inject { |acc, el| acc + el }
  arr_sum / arr.length.to_f
end

def repeat(str, num)
  str * num
end

def yell(str)
  str.upcase + "!"
end

def alternating_case(str)
  alt = str.split()
  alt.each_with_index do |ele, idx|
    if idx % 2 == 0 
      alt[idx] = ele.upcase
    else
      alt[idx] = ele.downcase
    end

  end
  alt.join(' ')
end