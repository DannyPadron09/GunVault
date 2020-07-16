class Ammunition < ApplicationRecord
    has_many :guns
    has_many :owners, through: :guns 

    scope :owners_ammo, -> { id_list = Ammunition.pluck(:owner_id)
        Ammunition.where(owner_id: id_list)
    }
   
    scope :guns_ammo, -> (caliber) {where("caliber == ?", caliber)
        amount = Ammunition.pluck(:caliber == caliber)
        Ammunition.where(caliber: amount)
    }

    # def quantity
        # caliber = Ammunition.find_by(:caliber)
    # end

end
