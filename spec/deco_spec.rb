require 'spec_helper'

describe NameDecorator do
  before :each do
    @person = Person.new 22, 'maximilianus'
    @capitalized_person = CapitalizeDecorator.new(@person)
    @capitalized_trimmed_person = TrimmerDecorator.new(@capitalized_person)
  end

  it 'person name is equal to maximilianus' do
    expect(@person.correct_name).to eql 'maximilianus'
  end

  it 'capitalizedPerson name starts with upcase' do
    expect(@capitalized_person.correct_name).to eql 'Maximilianus'
  end

  it 'capitalized_trimmed_person name should be <= 10' do
    expect(@capitalized_trimmed_person.correct_name.length).to be <= 10
  end
end
