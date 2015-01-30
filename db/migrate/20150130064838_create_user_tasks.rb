class CreateUserTasks < ActiveRecord::Migration
  def change
    create_table :user_tasks do |t|
      t.references :user_id, index: true
      t.integer :task_id
      t.boolean :status

      t.timestamps
    end
  end
end
