class User < ApplicationRecord
  has_many :tasks
  has_many :created_projects, foreign_key: "user_id", class_name: "Project"
  has_many :projects, through: :tasks
# the point of the line above this is to be able to call .projects on a user instance, to list all projects they have tasks for

  has_secure_password 

  validates :username, uniqueness: true,  presence: true
  validates :email, presence: true
end