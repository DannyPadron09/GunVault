class AddColumnUidToOwners < ActiveRecord::Migration[6.0]

  def change
    add_column :owners, :uid, :string
  end
  
end
