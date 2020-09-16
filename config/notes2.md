<%= link_to "My Projects", my_projects_path, class: "navbar-brand" %>    

<p>Here are the projects created by <%=@user.username%></p>
  <ol type =1 >
  <% @user.projects.each do |project|%>
  <li> <%= link_to project.name, my_projects_path%> </li>
  <% end %>
  </ol>

  <%= render partial: "projects", locals: {posts: @user.projects} %>

div>
   <ol type =1 >
  <% @user.projects.each do |project|%>
  <li> <%= link_to project.name, my_projects_path%> </li>
  <% end %>
  </ol>
</div>

  
   <%= link_to "Home", user_path(user), class: "navbar-brand" %>