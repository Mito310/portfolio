class CreateChoices < ActiveRecord::Migration[7.0]
  def change
    create_table :choices do |t|
      t.integer :c_code
      t.text :choice
      t.boolean :answer
      t.integer :q_code

      t.timestamps
    end
  end
end
