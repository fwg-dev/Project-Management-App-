class UsersController < ApplicationController

  def new 
     @user = User.new
  end

  def create 
    @user = User.new(user_params)
     if @user.save 
      session[:user_id] = @user.id
      redirect_to @user
      # flash[:message] ="You've successfully created an account!"
     else
      render :new
      # flash[:error] = "Account creation failure: #{@user.errors.full_messages.to_sentence}" 
     end
  end

  def show
    redirect_if_not_logged_in
    @user = User.find_by_id(params[:id])
    # @user = User.includes(projects: :task).find_by_id(params[:id])
     redirect_to '/' if !@user
  end

  private 

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
