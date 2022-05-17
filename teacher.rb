require('./person')

class Teacher < Person
  attr_reader :specialization

  def initialize(id, specialization, age, name = 'Unknown')
    super(age, name, id, parent_permission: true)
    @specialization = specialization
  end

  def can_use_services?
    true
  end

  def self.from_json(json)
    Teacher.new(json['id'], json['specialization'], json['age'], json['name'])
  end

  def self.to_json
    obj = {
      'id' => @id,
      'age' => @age,
      'name' => @name,
      'specialization' => @specialization
    }
    JSON.generate(obj)
  end
end
