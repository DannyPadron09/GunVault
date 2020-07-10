class CreateAmmunitions < ActiveRecord::Migration[6.0]

  def change
    create_table :ammunitions, id: false do |t|
      t.primary_key :ammunition_id
      t.string :caliber
      t.integer :owner_id
      t.timestamps
    end
  end

end
