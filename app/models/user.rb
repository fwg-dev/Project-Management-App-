class User < ApplicationRecord
  has_many :tasks
  has_many :created_projects, foreign_key: "user_id", class_name: "Project"
  has_many :projects, through: :tasks
# the point of the line above this is to be able to call .projects on a user instance, to list all projects they have tasks for

validates :username, uniqueness: true,  presence: true
validates :email, presence: true

  has_secure_password 


  def self.find_or_create_with_oauth(auth)
    user = User.find_by_uid(auth["uid"]) || User.find_or_create_by_email(auth)
    user.email = auth["info"]["email"]
    user.uid = auth["uid"]
    #  binding.pry
    user.save
    user
  end

  def self.find_or_create_by_email(auth)
    User.find_or_create_by(email: auth["info"]["email"]) do |user|
      user.uid = auth["uid"]
      user.password = SecureRandom.hex(20)
      user.username = auth["info"]["name"]
    end
  end
end