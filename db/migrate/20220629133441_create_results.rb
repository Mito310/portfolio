class CreateResults < ActiveRecord::Migration[7.0]
  def change
    create_table :results do |t|
      t.integer :rec_code
      t.integer :q_code
      t.boolean :user_answer

      t.timestamps
    end
  end
end
