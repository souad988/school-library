require './book'
require './classroom'
require './person'
require './rental'
require './student'

# souad = Student.new(23, 'souad')
# p souad.classroom
# # p souad.parent_permission
# teacher1 = Teacher.new('math',33,'soso')
# p teacher1
# class1 = Classroom.new('cm1')
# class1.add_student(souad)
# p souad.classroom.label
# p class1.students
# book1 = Book.new('book1', 'author1')
# rental1 = Rental.new('2022-05-01', book1, souad)
# p rental1
# p souad.rentals
# p book1.rentals

b = {tata: "soso", bm: 33}
#p b.tata
p b[:tata]
p b[tata]