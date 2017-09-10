class SectionsController < ApplicationController

  def index
    @teacher = Teacher.find(params[:teacher_id])
  end

  def show
    @section = Section.find(params[:id])
  end

  def new
    @teacher = Teacher.find(params[:teacher_id])
    @section = Section.new
  end

  def create
    @teacher = Teacher.find(params[:teacher_id])
    @section = @teacher.sections.new(section_params)
    if @section.save
      flash[:message] = "You created a #{@section.name}!"
      redirect_to teacher_path(@teacher)
    else
      flash[:message] = "Your record did not save. Make sure to fill in all fields!"
      render :new
    end
  end

  def edit
    @section = Section.find(params[:id])
  end

  def update
    @section = Section.find(params[:id])
    @section.update(section_params)
    if @section.save
      flash[:message] = "Your class has been updated!"
      redirect_to section_path(@section)
    else
      flash[:message] = "Your update did not save. Make sure to fill in all fields."
      render :edit
    end
  end

  def destroy
    @section = Section.find(params[:id])
    @section.destroy
    flash[:message] = "#{@section.name} has been deleted!"

    redirect_to teacher_path(@section.teacher)
  end

  private

  def section_params
    params.require(:section).permit(:name, :teacher_id)
  end
end
