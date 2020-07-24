class ChangeColumnName < ActiveRecord::Migration[6.0]

  def change
    rename_column :owners, :owners_id, :owner_id 
  end

end
