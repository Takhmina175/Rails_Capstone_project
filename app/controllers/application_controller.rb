class ApplicationController < ActionController::Base
before_action :set_current_user

  def set_current_user
    @current_user = User.find_by(id: session[:user_id]) if session[:user_id] 
  end

  def authenticate_user!
    redirect_to login_path, alert: 'Login required.' if @current_user.nil?
  end

  def h_votes
    Vote.maximum(:article_id)
  end
end
