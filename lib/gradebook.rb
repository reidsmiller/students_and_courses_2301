class Gradebook
  attr_reader :instructor, :courses, :all_students
  def initialize (instructor)
    @instructor = instructor
    @courses = []
    @all_students_a
  end

  def add_course(course)
    @courses << course
  end

  def all_students
    all_students = []
    @courses.each {|course| all_students << course.students}
    all_students.flatten
  end

  def list_all_students
    all_students_h = Hash.new {|hash, key| hash[key] = []}
    @courses.each do |course|
      all_students_h[course.name] = course.students
    end
    all_students_h
  end

  def students_below(score)
    score = score.to_f
    all_students = self.all_students
    failing_students = all_students.select do |student|
      student.grade < 70
    end
  end

  def all_grades
    all_grades_h = Hash.new {|hash, key| hash[key] = []}
    all_students_courses = self.all_students
    all_students.each do |student|
      all_grades_h[student.name] << student.grade
    end
    all_grades_h
  end

  def students_grade_range(low, high)
    low =low.to_f
    high = high.to_f
    all_students = self.all_students
    grade_range = all_students.select do |student|
      student.grade >= low && student.grade <= high
    end
  end
end