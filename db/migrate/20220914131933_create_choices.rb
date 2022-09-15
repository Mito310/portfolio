class CreateChoices < ActiveRecord::Migration[7.0]
  def change
    create_table :choices do |t|
      t.integer :choice_no
      t.text :choice
      t.boolean :answer
      t.integer :question_id

      t.timestamps
    end
  end
end
