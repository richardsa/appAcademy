class Dog
  def initialize(name, breed, age, bark, favorite_foods)
    @name = name
    @breed = breed
    @age = age
    @bark = bark
    @favorite_foods = favorite_foods
  end
  
  def name
    @name
  end
  
  def breed
    @breed
  end
  
  # get age 
  def age
    @age
  end
  
  # set age 
  def age=(new_age)
    @age = new_age 
  end
  
  def bark
    if @age > 3
      return @bark.upcase 
    else
      return @bark.downcase 
    end
  end
  
  # list favorite foods
  def favorite_foods
    @favorite_foods
  end
  
  def favorite_food?(food)
    # https://stackoverflow.com/a/9333993
    # use casecmp to check without converting array
    @favorite_foods.any?{ |ele| ele.casecmp(food)==0 }
  end
  
  # check if food is favorite 
  
end
