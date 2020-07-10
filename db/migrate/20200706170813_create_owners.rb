class CreateOwners < ActiveRecord::Migration[6.0]

  def change
    create_table :owners, id: false do |t|
      t.primary_key :owners_id, :limit => 8
      t.string :username
      t.string :password_digest
      t.string :favorite_gun
      t.integer :age
      t.timestamps
    end
  end

end