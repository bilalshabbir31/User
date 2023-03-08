require 'rails_helper'

RSpec.describe Student, type: :model do
  describe 'validations' do

    subject { Student.new }

    it "is valid with valid attributes" do
      subject.name = "Anything"
      #subject.email = "Anything@gmail.com"
      subject.age=0
      subject.phone_no=32653272
      expect(subject).to be_valid
    end

  end
end
