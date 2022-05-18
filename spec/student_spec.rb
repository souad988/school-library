require 'spec_helper'

describe Student do
  before :each do
    @stub_classroom = Classroom.new 'CM1'
    @student = Student.new 23, 'test STUDENT', 22, parent_permission: true
    @json = '{"id":262,"name":"ee","age":"23","parent_permission":true}'
    @generated_json = '{"id":22,"name":"test STUDENT","age":23,"parent_permission":true}'
  end

  it 'should be a student instance' do
    expect(@student).to be_instance_of Student
  end

  it 'student name shoud equal test STUDENT' do
    expect(@student.name).to eql 'test STUDENT'
  end

  it 'Student id shoud not be nil' do
    expect(@student.id).to_not be nil
  end

  it 'student classroom to be nil' do
    expect(@student.classroom).to be nil
  end

  it 'converts json to student object' do
    expect(Student.from_json(@json)).to be_instance_of Student
  end

  it 'generates json object for student' do
    expect(@student.to_json).to eql @generated_json
  end

  it 'adds classroom to student classroom' do
    @student.classroom = (@stub_classroom)
    expect(@student.classroom).to equal @stub_classroom
  end

  it 'adds student to classroom students ' do
    @student.classroom = (@stub_classroom)
    expect(@stub_classroom.students).to_not eql []
  end
end
