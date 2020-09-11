class ApplicationController < ActionController::Base
  
  private
  def current_user
    @current_user ||= User.find_by_id(id:session[:user_id])
  end
  


end
