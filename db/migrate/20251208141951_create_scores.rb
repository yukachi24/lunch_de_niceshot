class CreateScores < ActiveRecord::Migration[7.0]
  def change
    create_table :scores do |t|
      t.integer :part
      t.integer :half_score
      t.integer :half_putts
      t.references :round, null: false, foreign_key: true

      t.timestamps
    end
  end
end
