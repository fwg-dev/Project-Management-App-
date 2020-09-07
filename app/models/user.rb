class User < ApplicationRecord
  has_many :tasks
  has_many :projects, through: :tasks

  has_secure_password 

  validates :username, uniqueness: true,  presence: true
  validates :email, presence: true
end
