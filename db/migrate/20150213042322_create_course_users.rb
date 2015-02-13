class CreateCourseUsers < ActiveRecord::Migration
  def change
    create_table :course_users do |t|
      t.integer :course_id
      t.integer :user_id
      t.boolean :status

      t.timestamps
    end
  end
end
