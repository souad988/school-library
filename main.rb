#!/usr/bin/env ruby

class  Person
    def initialize(age, adress='', name)
        @age = age
        @name = name
        @adress = adress 
    end
end
def main
   person1 = Person.new(33,'souad')
   person2 = Person.new(4,'morocco','yassine')
   p person1.name,person2.name
end

main()