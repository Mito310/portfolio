class CreateRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :records do |t|
      t.integer :user_id
      t.date :date
      t.integer :subject_id
      t.integer :field_id

      t.timestamps
    end
  end
end
