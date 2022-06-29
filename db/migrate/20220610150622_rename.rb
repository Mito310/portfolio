class Rename < ActiveRecord::Migration[7.0]
  def change
    rename_column :questions, :subjecy_code, :subject_code

  end
end
