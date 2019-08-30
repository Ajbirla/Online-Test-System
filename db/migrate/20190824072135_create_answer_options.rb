class CreateAnswerOptions < ActiveRecord::Migration[5.2]
  def change
    create_table :answer_options do |t|
      t.references :choice, foreign_key: true
      t.references :answer, foreign_key: true

      t.timestamps
    end
  end
end
