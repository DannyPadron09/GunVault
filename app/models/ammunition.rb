class Ammunition < ApplicationRecord
    has_many :guns
    has_many :owners, through: :guns 

    validates :caliber, presence: true

    scope :low_ammo, -> {
        refill = where("ammunitions.quantity <= ?", 200)
    }

end
