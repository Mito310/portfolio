class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.integer :q_code, null:false
      t.text :q_sent, null:false
      t.integer :subject_code, nul:false
      t.integer :f_code, null:false

      t.timestamps
    end

  end
end
