class CreateCourseSubjects < ActiveRecord::Migration
  def change
    create_table :course_subjects do |t|
      t.references :course, index: true
      t.references :subject, index: true

      t.timestamps
    end
  end
end
