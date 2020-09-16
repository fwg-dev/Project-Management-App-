class ProjectsController < ApplicationController
  # before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :redirect_if_not_logged_in

  def index
    @projects = Project.all 
  end

  def my_index

    @projects = current_user.projects
  
  end

  def show
    @project = Project.find_by_id(params[:id])
   # redirect_to project_path if !@project
  end

  def new
   @project = Project.new
  end

  def edit 
    @project =Project.find_by_id(params[:id])
  end 

  def create 
    #binding.pry
    @project = current_user.projects.build(project_params)
      # @project = Project.new(project_params)
      # @project.user_id = session[:user_id]
      if @project.save #this is where validations happen 
       redirect_to project_path(@project), notice: 'Project was successfully created.'
      else
       render :new
      end
  end 
 

  def update 
    @project = Project.find(params[:id])
    
    if @project.update(project_params)
      redirect_to @project 
    else 
      render 'edit'
    end 
  end 

  def destroy 
    @project = Project.find_by(params[:id])
    @project.destroy
    redirect_to projects_path
  end 

  private


  def set_project
    @project = Project.find_by_id(params[:id])
  end

  # def require_login
  #   return head(:forbidden) unless session.include? :user_id
  # end

  def project_params 
    params.require(:project).permit(:name, :completion_status)
  end 
end


