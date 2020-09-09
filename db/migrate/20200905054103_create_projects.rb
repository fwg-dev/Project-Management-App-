class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.boolean :completion_status
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
