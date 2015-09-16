class TentativeRenommePersonToUser < ActiveRecord::Migration
  def change
    rename_column :tentatives, :person_id, :user_id
  end
end
