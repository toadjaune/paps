class AddActifToJours < ActiveRecord::Migration
  def change
    add_column :jours, :actif, :boolean
  end
end
