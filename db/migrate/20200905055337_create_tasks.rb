class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :description
      t.date :schedule
      t.string :completion_status

      t.timestamps
    end
  end
end
