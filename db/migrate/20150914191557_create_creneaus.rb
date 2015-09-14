class CreateCreneaus < ActiveRecord::Migration
  def change
    create_table :creneaus do |t|
      t.string :nom
      t.string :distance

      t.timestamps null: false
    end
  end
end
