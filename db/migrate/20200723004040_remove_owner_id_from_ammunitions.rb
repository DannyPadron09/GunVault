class RemoveOwnerIdFromAmmunitions < ActiveRecord::Migration[6.0]

  def change
    remove_column :ammunitions, :owner_id, :integer
  end

end

