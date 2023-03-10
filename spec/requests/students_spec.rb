require 'rails_helper'

RSpec.describe "StudentsController", type: :request do
  describe "GET /index" do
    
    # make get request
    it "get index request" do
      get students_path
      expect(response).to have_http_status(200)
      expect(response).to be_successful
    end

  end

  describe "POST /Create" do
    it 'make a post request' do
      post students_path(student: {name:"bilal",last_name:"shabbir", email:"something@gmail.com",phone_no:30132003212,age:13})
      expect(response).to have_http_status(201)
    end
  end

end
