class CreateGuns < ActiveRecord::Migration[6.0]

  def change
    create_table :guns, id: false do |t|
      t.primary_key :gun_id
      t.string :gun_name
      t.string :caliber
      t.integer :ammo_quantity
      t.integer :owner_id
      t.integer :ammunition_id
      t.timestamps
    end
  end

end
