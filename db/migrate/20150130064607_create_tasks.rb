class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.references :subject_id, index: true
      t.string :name
      t.text :content
      t.datetime :begin_at
      t.datetime :end_at

      t.timestamps
    end
  end
end
