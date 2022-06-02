class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.integer :q_code
      t.text :q_sent
      t.integer :subjet_code
      t.integer :f_code

      t.timestamps
    end
  end
end
