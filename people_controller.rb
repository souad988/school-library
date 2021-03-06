class PoepleController
  attr_reader :people

  def initialize
    @people = Query.read('people').map do |json|
      json = JSON.parse(json)
      if json.key?('specialization')
        Teacher.from_json(json)
      else
        Student.from_json(json)
      end
    end
  end

  def add(person)
    person = if person.key?('specialization')
               Teacher.new(person['specialization'], person['age'], person['name'])
             else
               Student.new(person['age'], person['name'], nil,
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

  def save
    serialized_data = @people.map(&:to_json)
    JSON.generate(serialized_data)
  end
end
