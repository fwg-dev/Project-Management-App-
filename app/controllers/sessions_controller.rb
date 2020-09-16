class SessionsController < ApplicationController
  
  def welcome 
  end

  def destroy
    session.delete(:user_id)
    redirect_to '/'
  end

  def new 
    #create a new user instance? 
  end
  
   def create 
          # byebug
      @user = User.find_by(username: params[:user][:username])
      #if @user.try(:authenticate, params[:user][:password])
      if @user && @user.authenticate(params[:user][:password])
        #actually log the user in 
        session[:user_id] = @user.id
        #then render user profile(user's profile page)
        redirect_to user_path(@user)
      else 
        #if not authenticated- throw error message 
        flash[:error] = "Sorry, The username and password you entered did not match our records. Please double-check and try again."
        #we redirect because we do not the user info to be persistent  
        redirect_to login_path
        
      end
   end 

  def google 
    @user= User.find_or_create_with_oauth(auth)
    session[:user_id] = @user.id
    #binding.pry
    redirect_to user_path(@user)
  end
 
  private 

  def auth
    request.env['omniauth.auth']
  end

 
end