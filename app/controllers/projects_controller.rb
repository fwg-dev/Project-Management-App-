class ProjectsController < ApplicationController
  
  def index
    @projects = Project.all 
  end

  def show
    @project = Project.find_by_id(params[:id])
   # redirect_to project_path if !@project
  end

  def new
   # code to create an empty project and send the user
   # to the New view for it (new.html.erb), which will have a
   # form for creating the project
    
   @project = Project.new
  end

  def edit 
    @project =Project.find_by_id(params[:id])
  end 

  def create 
    @project = Project.new(project_params)
    @project.user_id = session[:user_id]
    if @project.save
     redirect_to project_path(@project)
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

  def project_params 
    params.require(:project).permit(:name, :completion_status)
  end 
end

