class User < ApplicationRecord
  has_many :tasks
  has_many :created_projects, foreign_key: "user_id", class_name: "Project"
  has_many :projects, through: :tasks
# the point of the line above this is to be able to call .projects on a user instance, to list all projects they have tasks for

validate :username, uniqueness: true,  presence: true
# validates :email, presence: true

  has_secure_password 


  def self.find_or_create_with_oauth(auth)
    u = User.find_by_uid(auth["uid"]) || User.find_or_create_by_email(auth)
    u.email = auth["info"]["email"]
    u.uid = auth["uid"]
    #  binding.pry
    u.save
    u
  end

  def self.find_or_create_by_email(auth)
    User.find_or_create_by(email: auth["info"]["email"]) do |u|
      u.uid = auth["uid"]
      u.password = SecureRandom.hex(20)
      u.username = auth["info"]["name"]
    end
  end
end