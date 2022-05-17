require 'json'
module Query
  def self.create_path(file_name)
    File.expand_path([file_name, '.json'].join, './storage/')
  end

  def self.read(file_name)
    file = File.open(create_path(file_name))
    content = file.read
    file.close
    JSON.parse(content)
  end
end

Query.read('books')
