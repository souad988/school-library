require('./person')
class Student < Person
  attr_reader :classroom

  def initialize(age, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @classroom = nil
  end

  def classroom=(classr)
    @classroom.delete(self)
    @classroom = classr
    classr.students = (self) unless classr.students.include?(self)
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
