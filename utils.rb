module Utils
  def self.book_data
    print 'Title:'
    title = gets.chomp
    print 'Author:'
    author = gets.chomp
    { title: title, author: author }
  end

  def self.student_data
    print 'Name:'
    name = gets.chomp
    print 'Age'
    age = gets.chomp
    print 'parent permission yes\no'
    parent_permission = gets.chomp
    { name: name, age: age, parent_permission: parent_permission == 'yes' }
  end

  def self.teacher_data
    print 'Name:'
    name = gets.chomp
    print 'Age:'
    age = gets.chomp
    print 'Specialization:'
    specialization = gets.chomp
    { name: name, age: age, specialization: specialization }
  end

  def self.personid
    p 'person id:'
    gets.chomp
  end
end
