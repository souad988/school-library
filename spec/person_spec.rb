require 'spec_helper'

describe Person do
  before :each do
    @person = Person.new 13, 'test person', 12, parent_permission: false
  end

  it 'should be a person instance' do
    expect(@person).to be_instance_of Person
  end

  it 'person name shoud equal test person' do
    expect(@person.name).to eql 'test person'
  end

  it 'person id shoud not be nil' do
    expect(@person.id).to_not be nil
  end
   
  it 'person can_use_service to return true' do
    expect(@person.can_use_services?).to eql false
  end

  it 'rentals to be empty' do
    expect(@person.rentals).to eql []
  end
end
