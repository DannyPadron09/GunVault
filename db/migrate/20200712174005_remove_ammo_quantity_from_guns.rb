class RemoveAmmoQuantityFromGuns < ActiveRecord::Migration[6.0]

  def change
    remove_column :guns, :ammo_quantity, :integer
  end

end
