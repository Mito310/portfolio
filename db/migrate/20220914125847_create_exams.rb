class CreateExams < ActiveRecord::Migration[7.0]
  def change
    create_table :exams do |t|
      t.integer :question_id
      t.text :sentence
      t.integer :exam_no

      t.timestamps
    end
  end
end
