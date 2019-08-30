class AddFieldToAnswers < ActiveRecord::Migration[5.2]
  def change
    add_column :answers, :spend_time, :integer
  end
end
