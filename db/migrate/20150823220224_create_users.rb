class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.references :bar, index: true, foreign_key: true
      t.boolean :admin

      t.timestamps null: false
    end
    add_index :users, :name, unique: true
  end
end
