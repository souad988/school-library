require('./nameable')
class Person < Nameable
  attr_reader :rentals, :id

  def initialize(age, name = 'Unknown', id = nil, parent_permission: true)
    super()
    @id = id.nil? ? Random.rand(1..1000) : id
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  attr_accessor :name, :age

  def of_age?
    @age >= 18
  end
  private :of_age?

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end
end
