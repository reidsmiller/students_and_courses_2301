require './lib/student'

RSpec.describe Student do
  describe '#Iteration 1' do
    it 'can create a student with name and age and a scores array' do
      student = Student.new({name: "Morgan", age: 21})

      expect(student.name).to eq("Morgan")
      expect(student.age).to eq(21)
      expect(student.scores).to eq([])
    end

    it 'can log scores for student' do
      student = Student.new({name: "Morgan", age: 21})

      student.log_score(89)
      student.log_score(78)

      expect(student.scores).to eq([89, 78])
    end

    it 'can average grade for student' do
      student = Student.new({name: "Morgan", age: 21})

      student.log_score(89)
      student.log_score(78)

      expect(student.grade).to eq(83.5)
    end
  end
end