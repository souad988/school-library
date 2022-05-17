require('./person')
class Student < Person
  attr_reader :classroom

  def initialize(age, name = 'Unknown', parent_permission: true, id = Random.rand(1..1000))
    super(age, name, parent_permission: parent_permission, id)
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
    json = JSON.parse(json)
    Student.new(json['age'], json['name'], parent_permission: json['parent_permission'], json['id'])
  end

  def to_json
    obj = {
      'id' => @id,
      'age' => @age,
      'name' => @name,
      'parent_permission' => @parent_permission
    }
    JSON.generate(obj)
  end
end
