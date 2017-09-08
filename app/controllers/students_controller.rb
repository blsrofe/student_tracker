class StudentsController < ApplicationController

  def index
    @section = Section.find(params[:section_id])
  end

  def show
    @student = Student.find(params[:id])
  end

  def new
    @section = Section.find(params[:section_id])
    @student = Student.new
  end

  def create
    @section = Section.find(params[:section_id])
    @student = Student.new(student_params)
    if @student.save
      @section.students << @student
      redirect_to section_students_path(@section)
    else
      render :new
    end
  end

  private

  def student_params
    params.require(:student).permit(:first_name, :last_name, :section_id)
  end
end
