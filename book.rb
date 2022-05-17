class Book
  attr_reader :rentals
  attr_accessor :title, :author

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def self.from_json(json)
    Book.new(json['title'], json['author'])
  end

  def self.to_json
    obj = {
      'title' => @title,
      'author' => @author
    }
    JSON.generate(obj)
  end
end
