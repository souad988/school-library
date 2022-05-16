class PoepleController
  attr_reader :people

  def initialize
    @people = []
  end

  def add(person)
    person = if person.key?('specialization')
               Teacher.new(person['age'], person['name'], person['specialization'])
             else
               Student.new(person['age'], person['name'],
                           parent_permission: person['parent_persmission  [Y/N]'].upcase == 'Y')
             end
    puts "New #{person.class.name} added succesfully!"
    @people.push(person)
  end

  def list
    if @people.length.zero?
      puts 'People list is empty ! chose the option to add a new person'
    else
      @people.each_with_index do |person, index|
        puts "#{index + 1}- [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    end
    @people.length
  end
end
