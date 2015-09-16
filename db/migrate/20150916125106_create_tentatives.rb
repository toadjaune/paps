class CreateTentatives < ActiveRecord::Migration
  def change
    create_table :tentatives do |t|
      t.string :contenu
      t.belongs_to :pap
      t.belongs_to :person

      t.timestamps null: false
    end
  end
end
