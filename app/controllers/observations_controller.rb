require 'pry'
class ObservationsController < ApplicationController

  def index
    @student = Student.find(params[:student_id])
    @observation = @student.observations
  end

  def show
    @student = Student.find(params[:student_id])
    @observation = Observation.find(params[:id])
  end

  def new
    @student = Student.find(params[:student_id])
    @observation = @student.observations.new
  end

  def create
    @student = Student.find(params[:student_id])
    @observation = @student.observations.new(observation_params)
    if @observation.save
      redirect_to student_observation_path(@student, @observation)
    else
      render :new
    end
  end

  def edit
    @student = Student.find(params[:student_id])
    @observation = Observation.find(params[:id])
  end

  def update
    @student = Student.find(params[:student_id])
    @observation = Observation.find(params[:id])
    @observation.update(observation_params)
    if @observation.save
      redirect_to student_observation_path(@student, @observation)
    else
      render :edit
    end
  end

  def destroy
    @student = Student.find(params[:student_id])
    @observation = @student.observations.find(params[:id])
    @observation.destroy

    redirect_to student_path(@student)
  end


  private

  def observation_params
    params.require(:observation).permit(:date, :content, :student_id)
  end
end
