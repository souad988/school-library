require('./person')

class Teacher < Person
  def initialize(specialization, age, name = 'Unknown', parent_permission: true)
    super(name, age, parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end

teacher = Teacher.new('math', 'first', 45, false)
p teacher.name
p teacher.can_use_services?
