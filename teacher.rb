require('./person')

class Teacher < Person
  attr_reader :specialization

  def initialize(specialization, age, name = 'Unknown', id = nil)
    super(age, name, id, parent_permission: true)
    @specialization = specialization
  end

  def can_use_services?
    true
  end

  def self.from_json(json)
    json = JSON.parse(json) if json.is_a? String
    Teacher.new(json['specialization'], json['age'], json['name'], json['id'])
  end

  def to_json(*_args)
    JSON.generate({
                    id: @id,
                    age: @age,
                    name: @name,
                    specialization: @specialization

                  })
  end
end
