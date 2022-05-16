require 'pry'
require_relative './book'
require_relative './classroom'
require_relative './person'
require_relative './rental'
require_relative './student'
require_relative './teacher'
require_relative './utils'
require_relative './books_controller'
require_relative './people_controller'
require_relative './rentals_controller'

class App
  attr_reader :books, :people, :rentals

  def initialize()
    @options = ['list all books', 'list all people',
                'Create a person', 'Create a book',
                'Create a rental', 'List all rentals for a given person id',
                'Exit']
    @books_controller = BooksController.new
    @people_controller = PoepleController.new
    @rentals_controller = RentalsController.new
  end

  def display_options(arr)
    arr.each_with_index do |element, index|
      puts "#{index + 1} - #{element} "
    end
  end

  def list_all_books
    @books_controller.list
  end

  def list_all_people
    @people_controller.list
  end

  def add_new_rental
    @rentals_controller.add(@people_controller, @books_controller)
  end

  def add_new_book
    data = Utils.data(%w[title author])
    @books_controller.add(data)
  end

  def add_new_person
    puts '1- add student  2- add teacher '
    option = gets.chomp
    data = Utils.data(['age', 'name', option == '1' ? 'parent_persmission  [Y/N]' : 'specialization'])
    @people_controller.add(data)
  end

  def list_person_rentals
    list_all_people
    person_id = Utils.data(['person id'])['person id'].to_i
    @rentals_controller.list_by_person(person_id)
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
