class CreateUserSubjects < ActiveRecord::Migration
  def change
    create_table :user_subjects do |t|
      t.references :user_id, index: true
      t.references :subject_id, index: true
      t.boolean :status

      t.timestamps
    end
  end
end
