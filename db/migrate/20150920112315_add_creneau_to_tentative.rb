class AddCreneauToTentative < ActiveRecord::Migration
  def change
    add_column :tentatives, :creneau_id, :integer
  end
end
