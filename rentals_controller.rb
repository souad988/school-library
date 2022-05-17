class RentalsController
  def initialize
    @rentals = Query.read('rentals').map { |json| Rental.from_json(json) }
  end

  def add(date, book, person)
    @rentals.push(Rental.new(date, book, person))
    puts 'rental added successfully!'
  end

  def list_by_person(person_id)
    rentals =	@rentals.select do |rental|
      rental.person.id.to_s == person_id.to_s
    end
    list(rentals)
  end

  def list(rentals)
    rentals = @rentals if rentals == nil?
    rentals.each do |rental|
      puts "Date: #{rental.date} Book: #{rental.book.title} by #{rental.person.name} "
    end
  end

  def save
    serialized_data = @rentals.map(&:to_json)
    JSON.generate(serialized_data)
  end
end
