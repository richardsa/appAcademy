def my_map(arr, &prc)
  solution = []
  arr.each do |ele|
    solution << prc.call(ele)
  end
  solution
end

def my_select(arr, &prc) 
  solution = []
  arr.each do |ele|
    if prc.call(ele) 
      solution << ele 
    end
  end
  solution
  
end

def my_count(arr, &prc) 
  solution = 0
  arr.each do |ele|
    if prc.call(ele) 
      solution += 1
    end
  end
  solution
end

def my_any?(arr, &prc) 
  arr.each do |ele|
    if prc.call(ele) 
      return true
    end
  end
  return false
end

def my_all?(arr, &prc)
  arr.each do |ele|
    if !prc.call(ele) 
      return false
    end
  end
  return true
end

def my_none?(arr, &prc) 
  arr.each do |ele|
    if prc.call(ele) 
      return false
    end
  end
  return true
end
 