class StudentsController < ApplicationController

    def index
        @students = Student.all
    end

    def edit
        @student = Student.find(params[:id])
    end

    def create
        @student = Student.new(student_params)
        if @student.save
            redirect_to student_path(@student)
        else
            render :new
        end

    end

    def new
        @student = Student.new
    end

    def update
        @student = Student.find(params[:id])
        @student.update(student_params)
        if @student.save
            redirect_to student_path(@student)
        else
            render :edit
        end
    end

    def show
        @student = Student.find(params[:id])        
    end

 private
 
    def student_params
        params.require(:student).permit(:first_name, :last_name)
    end

end