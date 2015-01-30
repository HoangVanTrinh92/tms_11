class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.references :course, index: true
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
