class CreateCreneaus < ActiveRecord::Migration
  def change
    create_table :creneaus do |t|
      t.string :nom
      t.string :distance
      t.string :adresse
      t.string :commentaires
      t.string :type
      t.belongs_to :paps
      t.belongs_to :jour

      t.timestamps null: false
    end
  end
end
