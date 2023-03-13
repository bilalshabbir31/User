require 'rails_helper'

RSpec.describe StudentsController, type: :controller do
    describe "GET #index" do
        it "return a success response" do
            get :index
            expect(response).to have_http_status(200)
        end
    end

    describe "POST #create" do

        student_attr={
            name:"bilal",
            last_name: "shabbir",
            email: "anything@gmail.com",
            age: 45,
            phone_no: 30132003212
        }
        it "return a success response" do
            
            post :create, params: {
                student:student_attr
            }
            expect(response).to have_http_status(302)
            expect(response).to redirect_to(Student.last)
        end

        it "return error response" do
            student_attr[:name]=nil
            post :create, params: {student: student_attr}
            expect(response).to have_http_status(422)
            expect(response).to render_template("new")
        end
    end

    describe "GET #destroy" do
        let(:student) {Student.create(name:"bilal",last_name:"shabbir",email: "anything@gmail.com",phone_no: 30132003212,age:16)}
        it "deletes a student" do
        delete :destroy, params:{id: student.id}
        expect(response).to have_http_status(303)
        end
    end

end