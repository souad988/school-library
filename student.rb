require('./person')
class Student < Person
  attr_reader :classroom

  def initialize(id, age, name = 'Unknown', parent_permission: true)
    super(age, name, id, parent_permission: parent_permission)
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

  def self.from_json(json)
    Student.new(json['id'], json['age'], json['name'], parent_permission: json['parent_permission'])
  end

  def self.to_json
    obj = {
      'id' => @id,
      'age' => @age,
      'name' => @name,
      'parent_permission' => @parent_permission
    }
    JSON.generate(obj)
  end
end
