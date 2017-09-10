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
      flash[:message] = "You created a new observation for #{@student.first_name}!"
      redirect_to student_observation_path(@student, @observation)
    else
      flash[:message] = "Observation was not created. Make sure you fill in all fields."
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
      flash[:message] = "Your observation for #{@student.first_name} was updated!"
      redirect_to student_observation_path(@student, @observation)
    else
      flash[:message] = "Your observation was not updated. Make sure to fill in all fields."
      render :edit
    end
  end

  def destroy
    @student = Student.find(params[:student_id])
    @observation = @student.observations.find(params[:id])
    @observation.destroy
    flash[:message] = "Observation for #{@student.first_name} has been deleted!"
    redirect_to student_path(@student)
  end


  private

  def observation_params
    params.require(:observation).permit(:date, :content, :student_id, :teacher)
  end
end
