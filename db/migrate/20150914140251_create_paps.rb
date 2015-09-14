class CreatePaps < ActiveRecord::Migration
  def change
    create_table :paps do |t|
      t.string :question
      t.string :reponse
      t.belongs_to :jour, index: true
      t.belongs_to :bar

      t.timestamps null: false
    end
  end
end
