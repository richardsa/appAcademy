def reverser(str, &prc) 
  prc.call(str.reverse)
end

def word_changer(str, &prc) 
  sent = str.split(" ")
  solution = []
  sent.each do |ele|
    solution << prc.call(ele)
  end
  solution.join(" ")
end

def greater_proc_value(int, prc_1, prc_2) 
  val_1 = prc_1.call(int)
  val_2 = prc_2.call(int)
  if val_1 > val_2 
    return val_1
  else
    return val_2
  end
end

def and_selector(arr, prc_1, prc_2) 
  solution = []
  arr.each do |ele|
    if prc_1.call(ele) && prc_2.call(ele)
      solution << ele
    end
  end
  solution
end

def alternating_mapper(arr, prc_1, prc_2) 
  solution = []
  arr.each_with_index do |ele, idx|
    if idx.even?
      solution << prc_1.call(ele)
    else
      solution << prc_2.call(ele)
    end
  end
  solution
end
 
