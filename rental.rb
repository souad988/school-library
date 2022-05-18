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
    json = JSON.parse(json) if json.is_a? String
    person = if json.key?('specialization')
               Teacher.from_json(json['person'])
             else
               Student.from_json(json['person'])
             end
    Rental.new(json['date'], Book.from_json(json['book']), person)
  end

  def to_json(*_args)
    JSON.generate({
                    date: @date,
                    book: @book.to_json,
                    person: @person.to_json
                  })
  end
end
