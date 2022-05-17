require 'json'
module Query
  def self.create_path(file_name)
    File.expand_path([file_name, '.json'].join, './storage/')
  end

  def self.read(file_name)
    file = File.open(create_path(file_name))
    content = file.read
    file.close
    p content
    content == '' ? [] : JSON.parse(content)
  end

  def self.write(file_name, data)
    file = File.write(create_path(file_name), data)
  end
end

p JSON.generate({ title: 'ttttt', author: 'authorrrr' })
