require 'rails_helper'

RSpec.describe Student, type: :model do
  describe 'validations' do

    subject { Student.new(name: "Muhammad",last_name:"bilal",email:"anything@gmail.com",age:67,phone_no:13017320032) }

    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it 'it is not valid without firstname' do
      subject.name=nil
      expect(subject).to_not be_valid
    end

    it 'it is not valid withot email' do
      subject.email=nil
      expect(subject).to_not be_valid
    end

    it 'length of phone Number' do
      expect(subject.phone_no.to_s.length).to eq(11)
    end

    

    it 'return full name' do
      student=Student.create(name: "Muhammad",last_name: "Bilal",email: "anything@gmail.com")
      expect(student.full_name).to eq "Muhammad Bilal" 
    end

  end
end
