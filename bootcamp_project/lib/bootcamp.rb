class Bootcamp
  def initialize(name, slogan, student_capacity)
    @name = name
    @slogan= slogan
    @student_capacity= student_capacity
    @teachers = []
    @students = []
    @grades = Hash.new { | hash, key| hash[key] = [] }
  end
  
  def name
    @name
  end
  
  def slogan
    @slogan
  end
  
  def teachers
    @teachers
  end
  
  def students
    @students
  end
  
  def hire(name) 
    @teachers << name
  end
  
  def enroll(student) 
    if students.length < @student_capacity
      students << student 
      return true 
    else
      return false
    end
  end
  
  def enrolled?(student) 
    students.any?{ |ele| ele.casecmp(student)==0 }
  end
  
  def student_to_teacher_ratio 
    (students.length.to_f / teachers.length).floor
  end
  
  def add_grade(student, grade)
    if students.any?{ |ele| ele.casecmp(student)==0 }
      @grades[student] << grade 
      return true 
    else 
      return false
    end
  end
  
  def num_grades(student)
    if students.any?{ |ele| ele.casecmp(student)==0 }
      return @grades[student].length
    end
  end
  
  def average_grade(student)
    if students.any?{ |ele| ele.casecmp(student)==0 }
      grade_length = @grades[student].length 
      if grade_length <= 0 
        return nil
      end
      grade_sum = @grades[student].sum 
      grade_average = (grade_sum / grade_length.to_f).floor
      return grade_average

    else 
      return nil
    end
  end
  
end
