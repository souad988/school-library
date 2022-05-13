require './book'
require './classroom'
require './person'
require './rental'
require './student'

class App
    attr_reader :books, :people, :rentals
    def initialize()
        @books = []
        @people = {teacher:[],student:[]}
        @rentals = []
        @options =  ['list all books','list all people',
                     'Create a person','Create a book',
                     'Create a rental','List all rentals for a given person id',
                     'Exit']
    end
       
    def add_book(title,author)
        new_book = Book.new(title,author)
        @books.push(new_book)
    end

    def add_student(age,name,parent_permission)
        new_student = Student.new(age,name,parent_permission)
        @people[student].push(new_student)
    end

    def add_teacher(age,name,spe)
        new_teacher = Student.new(age,name,parent_permission)
        @people[teacher].push(new_teacher)
    end
    
    def add_rental(date,book,person)
        new_rental =  Rental.new(date,book,person)
        rentals.push(new_rental)
    end

    def rentals_by_person(person_id)
        @rentals.select {|rental| rental.person.id == person_id}
    end

    def list_all_books
        @books.each {|book| 
                        p "Title: \"#{book.title}\", Author: \"#{book.author}\""
                    }
    end


    def display_options(arr)
        arr.each_with_index do | element, index |
            puts "#{index+1} - #{element} "
        end
    end
    
    def run(option)
        case option
        when 1
            self.list_all_books()
            self.display_options
        end
    end
end
