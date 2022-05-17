class CreateSubjects < ActiveRecord::Migration[7.0]
  def change
    create_table :subjects do |t|
      t.integer :subject_code
      t.text :name

      t.timestamps
    end
  end
end
