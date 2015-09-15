class CreneauRenameTypeToGenre < ActiveRecord::Migration
  def change
    rename_column :creneaus, :type, :genre
  end
end
