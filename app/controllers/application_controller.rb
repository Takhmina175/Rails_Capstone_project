class ApplicationController < ActionController::Base 

private

  def current_user 
    if session[:user_id]
       @current_user ||= User.find(session[:user_id])
    end 
  end 
  helper_method :current_user 

  def authenticate_user! 
    redirect_to login_path unless current_user
  end
end
