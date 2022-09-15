class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.text :sentence
      t.integer :subject_id
      t.integer :field_id

      t.timestamps
    end
  end
end
