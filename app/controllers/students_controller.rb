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
      flash[:message] = "You created a #{@student.first_name}!"
      @section.students << @student
      redirect_to section_path(@section)
    else
      flash[:message] = "Student was not created. Make sure to fill in all fields."
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
      flash[:message] = "You edited #{@student.first_name}!"
      redirect_to student_path(@student)
    else
      flash[:message] = "Student was not updated. Make sure to fill in all fields."
      render :edit
    end
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy
    flash[:message] = "You deleted #{@student.first_name}!"

    redirect_to teacher_path(current_user)
  end


  private

  def student_params
    params.require(:student).permit(:first_name, :last_name, :section_id)
  end
end
