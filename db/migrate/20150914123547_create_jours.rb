class CreateJours < ActiveRecord::Migration
  def change
    create_table :jours do |t|
      t.string :date
      t.integer :max_commandos
      t.integer :max_affprev

      t.timestamps null: false
    end
    add_index :jours, :date, unique: true
  end
end
