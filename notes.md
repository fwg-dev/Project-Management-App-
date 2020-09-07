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