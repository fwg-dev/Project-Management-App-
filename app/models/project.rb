class Project < ApplicationRecord
  belongs_to :user #the creator 
  has_many :tasks
  has_many :users, through: :tasks

  validates :name, presence: true
end
