class SessionsController < ApplicationController
  def new
  end

  def create
    teacher = Teacher.find_by(username: params[:session][:username])
    if teacher && teacher.authenticate(params[:session][:password])
      session[:teacher_id] = teacher.id
      redirect_to teacher_path(teacher)
    else
      redirect_to login_path
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
