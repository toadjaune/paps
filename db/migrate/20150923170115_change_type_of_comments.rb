class ChangeTypeOfComments < ActiveRecord::Migration
  def change
    change_column :creneaus, :commentaires, :text
  end
end
