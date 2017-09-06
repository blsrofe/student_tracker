class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    @current_user ||= Teacher.find(session[:teacher_id]) if session[:teacher_id]
  end
end
