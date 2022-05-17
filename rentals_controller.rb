class RentalsController
  def initialize
    @rentals = Query.read('rentals').map { |json| Rental.from_json(json) }
  end

  def add(date, book, person)
    @rentals.push(Rental.new(date, book, person))
    puts 'rental added successfully!'
  end

  def list_by_person(person_id)
    rentals =	@rentals.select { |rental| rental.person.id == person_id }
    list(rentals)
  end

  def list(rentals)
    rentals = @rentals if rentals == nil?
    rentals.each do |rental|
      puts "Date: #{rental.date} Book: #{rental.book.title} by #{rental.person.name} "
    end
  end

  def save
    serialized_data = @rentals.map do |rental|
      rental.to_json
      p rental.to_json
    end
    JSON.generate(serialized_data)
  end
end
