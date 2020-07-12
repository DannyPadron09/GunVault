class Owner < ApplicationRecord
    has_secure_password
    has_many :guns
    has_many :ammunitions, through: :guns 
    accepts_nested_attributes_for :guns

    

    validates :username, uniqueness: true
    validates :username, presence: true
    validates :password, presence: true
    
    def gun_ids=(ids)
        ids.each do |id|
            gun = Gun.find_by(id: id)
            self.guns << gun 
        end
    end
 
    def all_guns
        self.gun_ids
    end

    def ammo_ids=(ids)
        ids.each do |id|
            ammo = Ammunition.find_by(id: id)
            self.ammo << ammo 
        end
    end

end
