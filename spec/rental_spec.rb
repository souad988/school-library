require 'spec_helper'

describe Rental do
  before :each do
    @person = Teacher.new 'Math', 23, 'test teacher', 22
    @book = Book.new 'test title', 'test author'
    @rental = Rental.new '2022/05/18', @book, @person
    @json = '{"date": "2022/05/18","book":{"title":"test title","author":"test author"},' \
            '"person": {"id":22,"age":23,"name":"test teacher","specialization":"Math"}}'
  end

  it 'should be a #Rental instance' do
    expect(@rental).to be_instance_of Rental
  end

  it 'rental date shoud equal test rental' do
    expect(@rental.date).to eql '2022/05/18'
  end

  it 'rental book shoud @book' do
    expect(@rental.book).to eql @book
  end

  it 'rental person to be @person' do
    expect(@rental.person).to eql @person
  end

  it 'converts json to rental object' do
    expect(Rental.from_json(@json)).to be_instance_of Rental
  end

  it 'book rentals in the rental is not empty' do
    expect(@rental.book.rentals).to_not be []
  end

  it 'person rentals in the rental is not empty' do
    expect(@rental.person.rentals).to_not be []
  end
end
