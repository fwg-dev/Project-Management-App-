class TasksController < ApplicationController

  def new
   # very simple code to create an empty task and send the user
   # to the New view for it (new.html.erb), which will have a
   # form for creating the task
    
   @task = Task.new
    @task.build_project
  end

  def edit 
    @task =Task.find(params[:id])
  end 

  def create 
    @task = Task.new(task_params)
    @task.user_id = session[:user_id]
    if @task.save 
     redirect_to task_path(@task)
    else
      @task.build_project
     render :new
    end

  end 

  def update 
  end 
  
  def show
     @task = Task.find_by_id(params[:id])
    # redirect_to tasks_path if !@task
  end

  
  def index

    @tasks = Task.all 
  #   @project = Project.find_by_id(params[:id])
  #   @task = @project.build_task

  #   # task belongs to a project 
  #   # @tasks = Task.all.includes(:project)

  end


  private

  def task_params 
    params.require(:task).permit(:description, :schedule, :completion_status, :project_id, project_attributes: [:name])
  end 
end

