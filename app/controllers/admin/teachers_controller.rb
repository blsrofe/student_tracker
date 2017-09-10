class Admin::TeachersController < Admin::BaseController

  def index
    @teachers = Teacher.all
  end

  def show
    @teacher = Teacher.find(params[:id])
  end

  def new
    @teacher = Teacher.new
  end

  def create
    @teacher = Teacher.new(teacher_params.tap{ |u| u[:role] = u[:role].to_i })
    if @teacher.save
      redirect_to "/admin/teachers"
    else
      #add flash message here
      render :new
    end
  end

  def edit
    @teacher = Teacher.find(params[:id])
  end

  def update
    @teacher = Teacher.find(params[:id])
    @teacher.update(teacher_params.tap{ |u| u[:role] = u[:role].to_i })
    if @teacher.save
      redirect_to "/admin/teachers"
    else
      render :edit
    end
  end

  def destroy
    @teacher = Teacher.find(params[:id])
    @teacher.destroy

    redirect_to "/admin/teachers"
  end

  private

  def teacher_params
    params.require(:teacher).permit(:first_name, :last_name, :username, :password, :role)
  end

end
