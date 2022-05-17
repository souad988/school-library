class Controller
    attr_reader :collection
  
    def initialize
      @collection = []
    end
  
    def add(data,object)
       = Book.new(book['title'], book['author'])
      @collection.push(object.new(data.val))
      puts 'book added successfully!'
    end
  
    def list
      if @books.length.zero?
        puts ' Book list is empty! choose the option to add a book from the list'
      else
        @books.each_with_index do |book, index|
          puts "#{index + 1}- Title: #{book.title}, Author: #{book.author}"
        end
      end
      @books.length
    end
  end