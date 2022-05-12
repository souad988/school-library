require('./nameable')
require('./person')
class NameDecorator < Nameable
  def initialize(nameable)
    super()
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name
  end
end

class CapitalizeDecorator < NameDecorator
  def correct_name
    @nameable.correct_name.capitalize
  end
end

class TrimmerDecorator < NameDecorator
  def correct_name
    @nameable.correct_name.length <= 10 ? @nameable.correct_name : @nameable.correct_name.chars[0..9].join
  end
end

person = Person.new(22, 'maximilianus')
p person.correct_name
capitalized_person = CapitalizeDecorator.new(person)
p capitalized_person.correct_name
capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
p capitalized_trimmed_person.correct_name
