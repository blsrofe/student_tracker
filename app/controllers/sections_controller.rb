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
      redirect_to teacher_path(@teacher)
    else
      #flash message
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
      redirect_to section_path(@section)
    else
      render :edit
    end
  end

  def destroy
    @section = Section.find(params[:id])
    @section.destroy

    redirect_to teacher_path(@section.teacher)
  end

  private

  def section_params
    params.require(:section).permit(:name, :teacher_id)
  end
end
