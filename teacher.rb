require('./person')

class Teacher < Person
  attr_reader :specialization

  def initialize( specialization, age, name = 'Unknown', id = Random.rand(1..1000))
    super(age, name, parent_permission: true, id)
    @specialization = specialization
  end

  def can_use_services?
    true
  end

  def self.from_json(json)
    json = JSON.parse(json)
    Teacher.new(json['specialization'], json['age'], json['name'], json['id'])
  end

  def to_json
    obj = {
      'id' => @id,
      'age' => @age,
      'name' => @name,
      'specialization' => @specialization
    }
    JSON.generate(obj)
  end
end
