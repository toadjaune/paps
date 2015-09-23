class ChangeTypeOfQuestion < ActiveRecord::Migration
  def change
    change_column :paps, :question, :text
    change_column :paps, :reponse, :text
  end
end
