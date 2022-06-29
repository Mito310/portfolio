class CreateRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :records do |t|
      t.integer :rec_code
      t.integer :user_id
      t.date :date
      t.integer :subject_code
      t.integer :f_code

      t.timestamps
    end
  end
end
