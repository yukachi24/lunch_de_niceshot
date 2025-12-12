class CreateLunches < ActiveRecord::Migration[7.0]
  def change
    create_table :lunches do |t|
      t.references :round, null: false, foreign_key: true
      t.string :comment

      t.timestamps
    end
  end
end
