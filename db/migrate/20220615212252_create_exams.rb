class CreateExams < ActiveRecord::Migration[7.0]
  def change
    create_table :exams do |t|
      t.integer :q_code
      t.text :q_sent
      t.integer :exam_id

      t.timestamps
    end
  end
end
