require './query'
class BooksController
  attr_reader :books

  def initialize()
    @books = Query.read('books')
  end

  def add(book)
    new_book = Book.new(book['title'], book['author'])
    @books.push(new_book)
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
