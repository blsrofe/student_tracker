class Admin::TeachersController < Admin::BaseController

  def index
    @teachers = Teacher.all
  end

  def show
    @teacher = Teacher.find(params[:id])
  end

end
