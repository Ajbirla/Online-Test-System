class CreateTestPapers < ActiveRecord::Migration[5.2]
  def change
    create_table :test_papers do |t|
      t.references :question, foreign_key: true
      t.references :test

      t.timestamps
    end
  end
end
