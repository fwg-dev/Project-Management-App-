class Task < ApplicationRecord
  belongs_to :user 
  belongs_to :project 


  validates :description, presence: true
  validates :completion_status, presence: true
  validates :schedule, presence: true
  validate :schedule_date_cannot_be_in_the_past 
 

    def schedule_date_cannot_be_in_the_past
      #if shedule_date is past - throw error
      if schedule.present? && schedule < Date.today
        errors.add(:schedule_date, "can't be in the past")
      end
    end
    
end
