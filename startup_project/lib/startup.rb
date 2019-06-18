require "employee"

class Startup
  attr_accessor :name, :funding, :salaries, :employees

  def initialize(name, funding, salaries)
    @name = name
    @funding = funding
    @salaries = salaries
    @employees = []
  end
  
  def valid_title?(title)
    @salaries.has_key?(title)
  end
  
  def >(startup)
    @funding > startup.funding
  end

  def hire(name,title)
    if self.valid_title?(title)
      new_employee = Employee.new(name,title)
      @employees << new_employee
    else 
      raise_error 
    end
  end
  
  def size
    @employees.length
  end
  
  def pay_employee(employee)
    salary = @salaries[employee.title]
    employee.pay(salary)
    new_funding = @funding - salary
    if new_funding > 0 
      @funding = new_funding 
    else 
      raise_error 
    end
  end
  
  def payday 
    @employees.each do |employee| 
      self.pay_employee(employee)
    end
  end
  
  def average_salary
    avg = 0
    @employees.each do |employee| 
      avg += @salaries[employee.title]
    end
    avg = avg / @employees.length
  end
  
  def close 
    @employees = []
    @funding = 0
  end
  
  def acquire(startup)
    @funding += startup.funding
    startup.salaries.each do |title, salary| 
      if !@salaries.has_key?(title)
        @salaries[title] = salary 
      end
    end
    startup.employees.each do |employee|
      @employees << employee 
    end
    
    startup.close
  end
end
