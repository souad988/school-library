class Classroom
  attr_reader :students
  attr_accessor :label

  def initialize(label)
    @label = label
    @students = []
  end

  def add_student(student)
    @students.push(student)
    student.classroom = self
  end

  def delete_student(student)
    @students.delete(student)
  end

  def students=(student)
    @students.push(student)
  end
end
