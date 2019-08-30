class RenameColumnToQuestions < ActiveRecord::Migration[5.2]
  def change
  rename_column :questions, :type, :q_type
  end
end
