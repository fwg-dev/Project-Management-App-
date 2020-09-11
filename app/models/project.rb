class Project < ApplicationRecord
  belongs_to :user #the creator 
  has_many :tasks
  has_many :users, through: :tasks
# the point of the line above this is to be able to call .users on a project instance, to list all users who have tasks for the project
  accepts_nested_attributes_for :tasks
  validates :name, presence: true
end
