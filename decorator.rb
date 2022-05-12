require('./nameable')
require('./person')
class NameDecorator < Nameable
    def initialize(nameable)
        @nameable = nameable
    end

    def correct_name
        @nameable.correct_name
    end
end

class CapitalizeDecorator < NameDecorator
    def correct_name
        @nameable.correct_name.capitalize()
    end
end

class TrimmerDecorator < NameDecorator
    def correct_name
        @nameable.correct_name.length<=10? @nameable.correct_name : @nameable.correct_name.split('')[0..9].join('')
    end
end

person = Person.new(22, 'maximilianus')
  p  person.correct_name
    capitalizedPerson = CapitalizeDecorator.new(person)
  p  capitalizedPerson.correct_name
    capitalizedTrimmedPerson = TrimmerDecorator.new(capitalizedPerson)
  p  capitalizedTrimmedPerson.correct_name