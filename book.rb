class Book
  attr_reader :rentals
  attr_accessor :title, :author

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def self.from_json(json)
    json = JSON.parse(json) if json.is_a? String
    Book.new(json['title'], json['author'])
  end

  def to_json(*_args)
    JSON.generate({ title: @title, author: @author })
  end
end
