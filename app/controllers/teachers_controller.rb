class TeachersController < ApplicationController
  def show
    @teacher = Teacher.find(params[:id])
  end

  def new
    @teacher = Teacher.new
  end

  def create
    @teacher = Teacher.new(teacher_params)
    if @teacher.save
      session[:teacher_id] = @teacher.id
      redirect_to teacher_path(@teacher)
    else
      flash[:message] = "Account was not created. Please try a different username and make sure all fields are filled in."
      redirect_to root_path
    end
  end

  def edit
    @teacher = Teacher.find(params[:id])
  end

  def update
    @teacher = Teacher.find(params[:id])
    @teacher.update(teacher_params)
    if @teacher.save
      flash[:message] = "You updated your profile!"
      redirect_to teacher_path(@teacher)
    else
      flash[:message] = "Profile was not updated. Make sure to fill in all fields."
      render :edit
    end
  end

  private

  def teacher_params
    params.require(:teacher).permit(:first_name, :last_name, :username, :password)
  end
end
