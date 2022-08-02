class AddColumnExams < ActiveRecord::Migration[7.0]
  def change
    add_column :exams, :exam_id, :integer
  end
end
