Models 
// relationships are important when building your app 

Rails console 
//rails c-s 
//this opens a sandbox to play around with. Any object we create are not going to be saved to the database
//User.create(username: 'bob')

...once you exit it rollsback the transaction 

Form_for or Form_tag 
//typically for login we use a form_tag because the log in is not creating a user. We are accessing a user that already exists 
//For signup we want a form_for because we are creating a new user 

******

Log in controller -- def new user 
// because we are not creating a user and not instantiating a user, we are telling it to find a model so we use (:user) not (@user)

*******
//byebug- use byebug 

to check to see if it is a valid user we type in params 

params -- this will return all the params the user needs to log in 

 *****

//def create 
we use find_by -- because it wont throw an error 
we need to put a key of username and not user_id 

*****
//APP FUNCTIONALITY: 

[] would you like user to login using email or username? - if email or username, then I'd like to make them unique! we set this in our user model! 
[] 

*******

//if @user.try(:authenticate, params[:user][:password])

--before calling the method it does is my user nil? or is my user something 

-- if it is nil, then it would not call .authenticate, it would return false 

-- if we found a user it will call authenticate 

-- if we found a user it will call authenticate, but if the passoword is wrong it will return false 

-- if the password is correct is will return the user object which is considered a truthy value 

-- 
//if @user && @user.authenticate(params[:user][:password])

-- this method works in a similar way as the one above 

***** 

for security purposes, we do not tell a person a direct error message of what went wrong, e.g if the user provided the wrong password 


***** 

flash errors for log in 

// The email you’ve entered doesn’t match any account. Sign up for an account.

// 
"Sorry, The username and password you entered did not match our records. Please double-check and try again."


******

the methods available when we have belongs_to rails methods(belongs_to Rails) 
- when we say what method, we are asking what attribute we want to assign? 
Taks model
belongs_to project

-- it has a build method 
def build_project
end
-- it has a reader method 
def project 
end 
-- it has a project_id method 
def project_id 
end 
--- it has a project_id= method 
def project_id= 
end 

*******

brands == project
ice_cream == task

Ice_cream model / Tasks
 belongs_to :brand
 belongs_to :user #creator of it


 Brand model / Project

  has_many :ice_creams
  validates :name, presence: true, uniqueness: true

Task Model 

 belongs_to :user 
  belongs_to :project 
  accepts_nested_attributes_for :project

Project model 

  has_many :tasks
  has_many :users, through: :tasks



******
change 
//  completion status to project status 
// add project_name to the task project 
// collection drop down menu not populating properly 

add to layout 

// <%= link_to "All Projects", projects_path %>
// <%= link_to "All Tasks", tasks_path%>

change project 

//change to checkbox instead of textfile 

*****

<a href="#projects" class="w3-bar-item w3-button">Projects</a>
      <a href="#about" class="w3-bar-item w3-button">About</a>
      <a href="#contact" class="w3-bar-item w3-button">Contact</a>

********


<h3>Category: <%= @post.category.try(:name)%></h3>
<% if @post.user == current_user %>
<h4><%= link_to "Edit Post", edit_post_path(@post)%></h4>
<% end %>

********

//END of URL tells you which page it is going to 


****** 

if we wanted a localhost:3000/tasks/1/project/new 

******

nested Routes 

options # new, show, or index 

-- our nest routes urls are: 
*will we eventually add users' nested routes? 
'/users'
'/users/:id/posts'
'/users/:id/comments'
'/posts'
'/posts/:id/comments' 

*********
In our project/new.html form 

Options for creating nested routes forms.. do we include task_id in the form? 
Option1 = post to a nested route- we need task_id 
Option 2 = include a hidden field - makes the create action cleaner. we can have one create action that is unnested

*******

<%= link_to 'Edit', edit_project_path(@project) %> |

 <%= link_to 'Delete', project_path(@project),method: :delete, data: { confirm: 'Are you sure you want to delete?' } %>
 <br>
 
 <br>
<%= link_to 'Back', projects_path %>

***********

  accepts_nested_attributes_for :project

  ******
  nest under the parent- 

  **********

  <h2>Add a task:</h2>
<%= form_with(model: [ @project, @project.tasks.build ], local: true) do |form| %>
</p>

<%= form.label :description %>
<%= form.text_field :name %>

<%= form.label :schedule %>
<%= form.text_field :schedule %>

<%= form.label :completion_status %>
<%= form.text_field :completion_status %>
 
 <p>
<%= form.submit %>
</p>
<% end %>
<br>
</div>
<br>
********** 
Link to adding task form in the project show page 

<h2>Add a task:</h2>
<%= form_with(model: [ @project, @project.tasks.build ], local: true) do |form| %>
</p>

<%= form.label :description %>
<%= form.text_field :name %>

<%= form.label :schedule %>
<%= form.date_field :schedule %>

<%= form.label :completion_status %>
<%= form.text_field :completion_status %>
 
 <p>
<%= form.submit %>
</p>
<% end %>
</div>
----- this is a link to the tasks within that project 

<h2>Tasks</h2>
<% @project.tasks.each do |task| %>
  <p>
    <strong>task:</strong>
    <%= Task.description %>
    <%= Task.schedule %>
    <%= Task.completion_status %>
    <h4>By: <%=link_to @task.user.username, user_path(@task.user)%> </h4>

  </p>
<% end %>


***********

if wanted to look at all tasks under one project 
task belongs to project 

--- we are creating a link to add a new task on the project's page 
--- if we were to add a task on the localhost:3000/projects page 

-----
  resources :tasks
  resources :projects do 
    resources :tasks, only: [:new, :create, :index]
  end

  what will we see when we view this page? localhost:3000/projects/2/tasks 

  // as opposed to the localhost:3000/tasks 

  ---- the first one will show us the project_id 

*********


****

<%= form_for(@task) do |f|%>
  <% if params[:project_id] %>
    <%= f.hidden_field :project_id %>
  <% else %>
    <div>
      <%= f.label :project_id, "Select a Project" %>
      <%= f.collection_select :project_id, Project.alpha, :id, :name, :completion_status, include_blank: true %>
    </div>
  <% end %>
  <div>
    <%= f.label :description %>
    <%= f.text_field :description %>
  </div>
  <br>
  <div>
    <%= f.label :schedule %>
    <%= f.text_field :schedule %>
  </div>
  <br>
  <div>
    <%= f.label :completion_status %>
    <%= f.text_area :completion_status %>
  </div>
  <br>

  <%= f.submit %>

<% end %>
 

 ******

<% if @project %>
  <h1>Tasks for <%= @project.name%> - <%= @project.completion_status%></h1>
<% else %>
  <h1>All the Tasks </h1>
<% end %>

*********
