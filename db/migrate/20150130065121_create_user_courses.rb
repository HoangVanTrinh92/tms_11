class CreateUserCourses < ActiveRecord::Migration
  def change
    create_table :user_courses do |t|
      t.references :user_id, index: true
      t.references :course_id, index: true
      t.boolean :status

      t.timestamps
    end
  end
end
