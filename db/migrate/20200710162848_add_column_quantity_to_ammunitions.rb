class AddColumnQuantityToAmmunitions < ActiveRecord::Migration[6.0]

  def change
    add_column :ammunitions, :quantity, :integer
  end

end
