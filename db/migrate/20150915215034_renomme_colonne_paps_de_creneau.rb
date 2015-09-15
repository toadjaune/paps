class RenommeColonnePapsDeCreneau < ActiveRecord::Migration
  def change
    rename_column :creneaus, :paps_id, :pap_id
  end
end
