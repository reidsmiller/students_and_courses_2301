require './lib/course'
require './lib/student'

RSpec.describe Course do
  describe '#Iteration 2' do
    it 'can create a course' do
      course = Course.new("Calculus", 2)

      expect(course.name).to eq("Calculus")
      expect(course.capacity).to eq(2)
      expect(course.students).to eq([])
    end

    it 'can add students but only to capacity' do
      course = Course.new("Calculus", 2)
      student1 = Student.new({name: "Morgan", age: 21})
      student2 = Student.new({name: "Jordan", age: 29})
      student3 = Student.new({name: "Bob", age: 19})

      expect(course.full?).to be false

      course.enroll(student1)
      course.enroll(student2)

      expect(course.students).to eq([student1, student2])
      expect(course.full?).to be true

      course.enroll(student3)

      expect(course.students).to eq([student1, student2])
    end
  end
end