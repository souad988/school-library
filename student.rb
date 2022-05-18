require('./person')
class Student < Person
  attr_reader :classroom

  def initialize(age, name = 'Unknown', id = nil, parent_permission: true)
    super(age, name, id, parent_permission: parent_permission)
    @classroom = nil
  end

  def classroom=(classr)
    @classroom.delete(self) if (@classroom != nil)
    @classroom = classr
    classr.students = (self) unless classr.students.include?(self)
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

  def self.from_json(json)
    json = JSON.parse(json) if json.is_a? String
    Student.new(json['age'], json['name'], json['id'], parent_permission: json['parent_permission'])
  end

  def to_json(*_args)
    JSON.generate({
                    id: @id,
                    name: @name,
                    age: @age,
                    parent_permission: @parent_permission

                  })
  end
end
