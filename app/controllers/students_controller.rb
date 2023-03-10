class StudentsController < ApplicationController
    def index
        @students=Student.all
    end
    def new
        @student=Student.new
    end
    def create
        debugger
        @student=Student.new(student_params)
        if @student.save
            redirect_to students_path, status: 201
        end
    end

    private
    
    def student_params
        params.require(:student).permit(:name,:last_name,:age,:email,:phone_no)
    end
end
