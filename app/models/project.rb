class Project < ApplicationRecord
  belongs_to :user #the creator 
  has_many :tasks
  has_many :users, through: :tasks
# the point of the line above this is to be able to call .users on a project instance, to list all users who have tasks for the project
  accepts_nested_attributes_for :tasks
 
  validates :name, presence: true, uniqueness: true
  validate :not_a_duplicate


  def not_a_duplicate 
    #if there is already a ptoject with that name && task throw an error
    if Project_find_by(name:name, task_id:task_id)
      errors.add(:name, "has already been added for that project")
    end

  end
end
