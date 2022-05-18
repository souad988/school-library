require 'spec_helper'

describe Teacher do
  before :each do
    @teacher = Teacher.new 'Math', 23, 'test teacher', 22
    @json = '{"id":22,"age":23,"name":"test teacher","specialization":"Math"}'
  end

  it 'should be a teacher instance' do
    expect(@teacher).to be_instance_of Teacher
  end

  it 'teacher name shoud equal test teacher' do
    expect(@teacher.name).to eql 'test teacher'
  end

  it 'teacher id shoud  be 22' do
    expect(@teacher.id).to eql 22
  end

  it 'teacher specialization to be nil' do
    expect(@teacher.specialization).to eql 'Math'
  end

  it 'converts json to teacher object' do
    expect(Teacher.from_json(@json)).to be_instance_of Teacher
  end

  it 'generates json object for teacher' do
    expect(@teacher.to_json).to eql @json
  end
end
