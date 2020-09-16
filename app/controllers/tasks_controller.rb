class TasksController < ApplicationController
 
  def index
    #is this a nested route? 
    if params[:project_id] && @project = Project.find_by_id(params[:project_id])
    #if nested
    @tasks = @project.tasks.most_tasks
    #if so, we want only tasks of that brand 
    else 
    #if not,  show all tasks 
    @tasks = Task.all

    end
  end 

  def show
    @task = Task.find_by_id(params[:id])
   # redirect_to tasks_path if !@task
  end

  def new
   # very simple code to create an empty task and send the user
   # to the New view for it (new.html.erb), which will have a
   # form for creating the task
   if params[:project_id] && @project = Project.find_by_id(params[:project_id])
      @task = @project.tasks.build
      #task belongs to project
   else 
    @task = Task.new
  end 
 end 

  def edit 
    @task =Task.find(params[:id])
  end 

  def create 
   @task = Task.new(task_params)
    #@task = current_user.tasks.build(task_params)
    @task.user_id = session[:user_id]
    if @task.save
     redirect_to task_path(@task)
    else
      render :new
    end

  end 

  def update 
    @task = Task.find(params[:id])
    
    if @task.update(task_params)
      redirect_to @task 
    else 
      render 'edit'
    end 
  end 

  def destroy 
    @task = Task.find_by(params[:id])
   #redirect_if_not_allowed
    @task.destroy
    redirect_to tasks_path
  end 

  private
  # def redirect_if_not_allowed
  #   if @task.user != current_user
  #   redirect_to '/' 
  #   end
  # end
  def task_params 
    params.require(:task).permit(:description, :schedule, :completion_status, :project_id, project_attributes: [:name])
  end 
end

