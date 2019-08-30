class CreateTests < ActiveRecord::Migration[5.2]
  def change
    create_table :tests do |t|
      t.references :question, foreign_key: true
      t.integer :no_of_questions
      t.time :duration
      t.text :description
      t.integer :total_mark

      t.timestamps
    end
  end
end
