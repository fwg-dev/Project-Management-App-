module TasksHelper

  def display_header(task)
    if params[:project_id]
      content_tag(:h1, "Create a new task for #{task.project.name} ")
    else
        content_tag(:h1, "Create a New Task")
    end
  end

end
