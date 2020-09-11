class Task < ApplicationRecord
  belongs_to :user 
  belongs_to :project 


  validates :description, presence: true
  validates :schedule, presence: true
  validates :completion_status, presence: true


end
