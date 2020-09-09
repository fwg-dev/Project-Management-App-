class ProjectsController < ApplicationController

  def new 
  end 
  
  def index 
    @projects = Project.all
  end
  
  
end
