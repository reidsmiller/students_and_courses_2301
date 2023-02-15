require './lib/student'
require './lib/course'
require './lib/gradebook'

RSpec.describe Gradebook do
  describe '#Iteration 3' do
    it 'can create a gradebook and instructor and courses' do
      gradebook = Gradebook.new('Prof Einstein')

      expect(gradebook.instructor).to eq('Prof Einstein')
      expect(gradebook.courses).to eq([])
    end

    it 'can add courses' do
      gradebook = Gradebook.new('Prof Einstein')
      course1 = Course.new('Calculus', 2)
      course2 = Course.new('Algebra', 3)

      gradebook.add_course(course1)
      gradebook.add_course(course2)

      expect(gradebook.courses).to eq([course1, course2])
    end

    it 'can list all students across all courses' do
      gradebook = Gradebook.new('Prof Einstein')
      course1 = Course.new('Calculus', 2)
      course2 = Course.new('Algebra', 3)
      student1 = Student.new({name: "Morgan", age: 21})
      student2 = Student.new({name: "Jordan", age: 29})
      student3 = Student.new({name: "Bob", age: 19})
      student4 = Student.new({name: "Fela", age: 27})
      
      gradebook.add_course(course1)
      gradebook.add_course(course2)
      course1.enroll(student1)
      course1.enroll(student2)
      course2.enroll(student3)
      course2.enroll(student4)

      expect(gradebook.list_all_students).to eq({"Calculus"=>[student1, student2,], "Algebra"=>[student3, student4]})
    end

    it 'can show students below threshold' do
      gradebook = Gradebook.new('Prof Einstein')
      course1 = Course.new('Calculus', 2)
      course2 = Course.new('Algebra', 3)
      student1 = Student.new({name: "Morgan", age: 21})
      student2 = Student.new({name: "Jordan", age: 29})
      student3 = Student.new({name: "Bob", age: 19})
      student4 = Student.new({name: "Fela", age: 27})
      
      gradebook.add_course(course1)
      gradebook.add_course(course2)

      course1.enroll(student1)
      course1.enroll(student2)
      course2.enroll(student3)
      course2.enroll(student4)

      student1.log_score(88)
      student1.log_score(90)
      student2.log_score(50)
      student2.log_score(65)
      student3.log_score(70)
      student4.log_score(90)
      student4.log_score(49)

      expect(gradebook.students_below(70)).to eq([student2, student4])
    end
  end

  describe '#Iteration 4' do
    it 'can track all grades across all courses' do
      gradebook = Gradebook.new('Prof Einstein')
      course1 = Course.new('Calculus', 2)
      course2 = Course.new('Algebra', 3)
      student1 = Student.new({name: "Morgan", age: 21})
      student2 = Student.new({name: "Jordan", age: 29})
      student3 = Student.new({name: "Bob", age: 19})
      student4 = Student.new({name: "Fela", age: 27})
      
      gradebook.add_course(course1)
      gradebook.add_course(course2)

      course1.enroll(student1)
      course1.enroll(student2)
      course2.enroll(student3)
      course2.enroll(student4)

      student1.log_score(88)
      student1.log_score(90)
      student2.log_score(50)
      student2.log_score(65)
      student3.log_score(70)
      student4.log_score(90)
      student4.log_score(49)

      expect(gradebook.all_grades).to eq({"Morgan"=>[89.0], "Jordan"=>[57.5], "Bob"=>[70.0], "Fela"=>[69.5]})
    end

    it 'can find students within a given grade range' do
      gradebook = Gradebook.new('Prof Einstein')
      course1 = Course.new('Calculus', 2)
      course2 = Course.new('Algebra', 3)
      student1 = Student.new({name: "Morgan", age: 21})
      student2 = Student.new({name: "Jordan", age: 29})
      student3 = Student.new({name: "Bob", age: 19})
      student4 = Student.new({name: "Fela", age: 27})
      
      gradebook.add_course(course1)
      gradebook.add_course(course2)

      course1.enroll(student1)
      course1.enroll(student2)
      course2.enroll(student3)
      course2.enroll(student4)

      student1.log_score(88)
      student1.log_score(90)
      student2.log_score(50)
      student2.log_score(65)
      student3.log_score(70)
      student4.log_score(90)
      student4.log_score(49)

      expect(gradebook.students_grade_range(70, 90)).to eq([student1, student3])
    end
  end
end