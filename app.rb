require 'pry'
require './book'
require './classroom'
require './person'
require './rental'
require './student'
require './teacher'
require './utils'

class App
  attr_reader :books, :people, :rentals

  def initialize()
    @books = []
    @people = []
    @rentals = []
    @options = ['list all books', 'list all people',
                'Create a person', 'Create a book',
                'Create a rental', 'List all rentals for a given person id',
                'Exit']
  end

  def add_book(title, author)
    new_book = Book.new(title, author)
    @books.push(new_book)
  end

  def add_student(age, name, parent_permission)
    new_student = Student.new(age, name, parent_permission: parent_permission)
    @people.push(new_student)
  end

  def add_teacher(age, name, specialization)
    new_teacher = Teacher.new(specialization, age, name)
    @people.push(new_teacher)
  end

  def add_rental(date, book, person)
    new_rental = Rental.new(date, book, person)
    rentals.push(new_rental)
  end

  def rentals_by_person(person_id)
    @rentals.select { |rental| rental.person.id == person_id }
  end

  def display_options(arr)
    arr.each_with_index do |element, index|
      puts "#{index + 1} - #{element} "
    end
  end

  def list_all_books
    if @books.length.zero?
      puts 'empty list! choose the option to add a book from the list'
    else
      @books.each_with_index do |book, index|
        puts "#{index + 1}- Title: #{book.title}, Author: #{book.author}"
      end
    end
  end

  def list_all_people
    if @people.length.zero?
      puts 'empty list!!'
    else
      @people.each_with_index do |person, index|
        p "#{index + 1}- [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    end
  end

  def add_new_rental
    puts 'chose index of the book from this list'
    list_all_books
    print 'Book:'
    book_index = gets.chomp
    book = @books[book_index.to_i - 1]
    puts 'chose index of the person from this list'
    list_all_people
    print 'Person:'
    person_index = gets.chomp
    person = @people[person_index.to_i - 1]
    print 'Date:'
    date = gets.chomp
    add_rental(date, book, person)
    puts 'rental added successfully!'
  end

  def book_data
    Utils.book_data
  end

  def add_new_book
    data = book_data
    add_book(data[:title], data[:author])
    puts 'book added successfully!'
  end

  def student_data
    Utils.student_data
  end

  def teacher_data
    Utils.teacher_data
  end

  def add_new_person
    puts '1- add student  2- add teacher '
    person_option = gets.chomp
    case person_option
    when '1'
      data = student_data
      add_student(data[:age], data[:name], data[:parent_permission])
      puts 'new student added successfully!'
    when '2'
      data = teacher_data
      add_teacher(data[:age], data[:name], data[:specialization])
      puts 'new teacher added succesfully!'
    else
      puts 'enter a valide value from the list!!'
    end
  end

  def personid
    Utils.personid
  end

  def list_person_rentals
    list_all_people
    person_id = personid.to_i
    rentals = rentals_by_person(person_id)
    rentals.each do |rental|
      puts "Date: #{rental.date} Book: #{rental.book.title} by #{rental.person.name} "
    end
  end

  def run()
    methods = {}
    methods[1] = method(:list_all_books)
    methods[2] = method(:list_all_people)
    methods[3] = method(:add_new_person)
    methods[4] = method(:add_new_book)
    methods[5] = method(:add_new_rental)
    methods[6] = method(:list_person_rentals)
    methods[7] = method(:exit)

    option = ''
    while option != '7'
      display_options(@options)
      option = gets.chomp
      methods[option.to_i].call
    end
    exit
  end
end
