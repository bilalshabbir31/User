class StudentsController < ApplicationController
    def index
        @students=Student.all
    end
    def new
        @student=Student.new
    end
    def create
        @student=Student.new(student_params)
        if @student.save
            MyMailer.welcome_email(@student).deliver_now
            redirect_to @student, status: 302
        else
            render :new, status: :unprocessable_entity
        end
    end

    def show
        @student=Student.find(params[:id])
    end

    def destroy
        @student=Student.find(params[:id])
        if @student.destroy
            redirect_to students_path, status: :see_other
        else
            render :index, status: :unprocessable_entity
        end
    end

    private
    
    def student_params
        params.require(:student).permit(:name,:last_name,:age,:email,:phone_no)
    end
end
