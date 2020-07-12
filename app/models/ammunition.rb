class Ammunition < ApplicationRecord
    has_many :guns
    has_many :owners, through: :guns 

    scope :owners_ammo, lambda { |x|
        id_list = Ammunition.pluck(:owner_id) - x.ammunitions.pluck(:owner_id)
        Ammunition.where(owner_id: id_list)
    }
    
    def caliber=(name)
        name.each do |caliber|
            ammo = Ammunition.find_by(caliber: caliber)
            self.caliber << caliber
        end
    end
    
end
