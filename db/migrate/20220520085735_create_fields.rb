class CreateFields < ActiveRecord::Migration[7.0]
  def change
    create_table :fields, primary_key: %w(subject_code f_code) do |t|
      t.integer :subject_code, null:false
      t.integer :f_code, null:false
      t.text :f_name, null:false

      t.timestamps
    end
  end
end
