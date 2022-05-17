class Rental
  attr_reader :book, :person
  attr_accessor :date

  def initialize(date, book, person)
    @date = date
    @book = book
    book.rentals.push(self) unless book.rentals.include?(self)
    @person = person
    person.rentals.push(self) unless person.rentals.include?(self)
  end

  def self.from_json(json)
    person = if json['person'].key?('specialization')
               Teacher.from_json(json['person'])
             else
               Student.from_json(json['person'])
             end
    Rental.new(json['date'], Book.from_json(json['book']), person)
  end

  def self.to_json
    obj = {
      'date' => @date,
      'book' => @book.to_json,
      'person' => @person.to_json
    }
    JSON.generate(obj)
  end
end
