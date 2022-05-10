require('./person')
class Student < Person
  def initialize(classroom, age, parent_permission, name)
    super(name, age, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
