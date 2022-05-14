require 'pry'
require './book'
require './classroom'
require './person'
require './rental'
require './student'
require './teacher'

class App
    attr_reader :books, :people, :rentals
    def initialize()
        @books = []
        @people = []
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
        p "from add sudent #{age} #{name} #{parent_permission}"
        new_student = Student.new(age,name,parent_permission: parent_permission)
        @people.push(new_student)
    end

    def add_teacher(age,name,specialization)
        new_teacher = Teacher.new(specialization,age,name)
        @people.push(new_teacher)
    end
    
    def add_rental(date,book,person)
        new_rental =  Rental.new(date,book,person)
        rentals.push(new_rental)
    end

    def rentals_by_person(person_id)
        @rentals.select {|rental| rental.person.id == person_id}
    end

    def display_options(arr)
        arr.each_with_index do | element, index |
            puts "#{index+1} - #{element} "
        end
    end

    def list_all_books
        if (@books.length == 0)
            p 'empty list! choose the option to add a book from the list'
        else 
            @books.each_with_index do |book,index| 
                            p "#{index+1}- Title: #{book.title}, Author: #{book.author}"
            end 
        end
        
    end

    def list_all_people
        if (@people.length == 0) 
            p 'empty list!!'
        else
            @people.each_with_index do|person,index|
                 p "#{index+1}- [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
            end
        end          
    end
    
    def add_new_rental
        p 'date:'
        date = gets.chomp
        p 'chose index of the book from this list'
        self.list_all_books()
        book_index = gets.chomp
        book = @books[book_index.to_i - 1]
        p 'chose index of the person from this list'
        self.list_all_people()
        person_index = gets.chomp
        person = @people[person_index.to_i - 1]
        self.add_rental(date,book,person)
        p 'rental added successfully!'
    end


    def get_book_data
        p 'Title:'
        title = gets.chomp
        p 'Author:'
        author = gets.chomp
        {title: title, author: author}
    end
    
    def add_new_book
        data = get_book_data()
        self.add_book(data[:title],data[:author])
        p 'book added successfully!'
    end
    def get_student_data
        p 'Name:'
        name = gets.chomp
        p 'Age'
        age = gets.chomp
        p 'parent permission yes\no'
        parent_permission = gets.chomp
        {name: name, age: age, parent_permission: parent_permission=='yes'? true : false}
    end

    def get_teacher_data
        p 'Name:'
        name = gets.chomp
        p 'Age:'
        age = gets.chomp
        p 'Specialization:'
        specialization = gets.chomp
        {name: name, age: age, specialization: specialization}
    end

    def add_new_person
            p '1- add student  2- add teacher '
            person_option = gets.chomp
            case person_option
            when '1'
                data = self.get_student_data()
                p data
                self.add_student(data[:age], data[:name], data[:parent_permission])
                p 'new student added successfully!'
            when '2'
                data = self.get_teacher_data()
                p data
                self.add_teacher(data[:age], data[:name], data[:specialization])
                p 'new teacher added succesfully!'  
            else 
                p 'enter a valide value from the list!!'
            end   
    end
    def get_personid
        p 'person id:'
        person_id = gets.chomp
        person_id
    end

    def list_person_rentals
        self.list_all_people()
        person_id = self.get_personid().to_i
        rentals = self.rentals_by_person(person_id)
        rentals.each do |rental|
                     p "Date: #{rental.date} Book: #{rental.book.title} by #{rental.person.name} "
        end
        binding.pry
    end

    def run()
        option = ''
        while(option!= '7')
            display_options(@options)
            option = gets.chomp
            case option
            when '1'
                self.list_all_books()
            when '2'
                self.list_all_people()
            when '3'
                self.add_new_person() 
            when '4'
                self.add_new_book()
            when '5'
                self.add_new_rental()
            when '6'
                self.list_person_rentals()
            when '7'
                p 'tanks for using this app'  
            else 
                p 'chose a valide option from the list'    
            end
        end
        exit()
    end
end
