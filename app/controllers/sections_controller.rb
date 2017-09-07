class SectionsController < ApplicationController

  def show
    @teacher = Teacher.find(params[:teacher_id])
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
      redirect_to teacher_section_path(@teacher, @section)
    else
      #flash message
      render :new
    end
  end

  private

  def section_params
    params.require(:section).permit(:name, :teacher_id)
  end
end
