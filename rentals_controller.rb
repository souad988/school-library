require_relative './rental'

class RentalsController
  def initialize
    @rentals = []
  end

  def add(people, books)
    puts 'chose index of the book from this list'
    available_books = books.list
    if available_books.zero?
      puts 'Please add some books'
      return
    end

    book_index = gets.chomp
    book = books.books[book_index.to_i - 1]
    puts 'chose index of the person from this list'
    people = people.list
    if people.zero?
      puts 'Please add some people'
      return
    end
    print 'Person:'
    person_index = gets.chomp
    person = people.people[person_index.to_i - 1]
    print 'Date:'
    date = gets.chomp

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
end
