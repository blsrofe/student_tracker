class StudentsController < ApplicationController

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
      redirect_to section_path(@section)
    else
      render :new
    end
  end

  def edit
    @student = Student.find(params[:id])
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

  def destroy
    @student = Student.find(params[:id])
    @student.destroy

    redirect_to teacher_path(current_user)
  end


  private

  def student_params
    params.require(:student).permit(:first_name, :last_name, :section_id)
  end
end
