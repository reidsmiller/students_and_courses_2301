class Gradebook
  attr_reader :instructor, :courses
  def initialize (instructor)
    @instructor = instructor
    @courses = []
  end

  def add_course(course)
    @courses << course
  end

  def list_all_students
    all_students = []
    @courses.each {|course| all_students << course.students}
    all_students.flatten
  end

  def students_below(score)
    score = score.to_f
    all_students = self.list_all_students
    failing_students = all_students.select do |student|
      student.grade < 70
    end
  end
end