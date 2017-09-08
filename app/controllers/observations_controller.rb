class ObservationsController < ApplicationController

  def index
    @student = Student.find(params[:student_id])
  end

  def new
    @student = Student.find(params[:student_id])
    @observation = Observation.new
  end

  def create
    @student = Student.find(params[:student_id])
    @observation = @student.observations.new(observation_params)
    if @observation.save
      redirect_to student_observations_path(@student)
    else
      render :new
    end
  end

  private

  def observation_params
    params.require(:observation).permit(:date, :content, :student_id)
  end
end
