class Owner < ApplicationRecord
    has_secure_password
    has_many :guns
    has_many :ammunitions, through: :guns 

    validates :username, uniqueness: true
    # validates :password, presence: true
    
    def gun_ids=(ids)
        ids.each do |id|
            gun = Gun.find_by(id: id)
            self.guns << gun 
        end
    end
 
    def all_guns
        self.gun_ids
    end

    # def self.create_with_omniauth(auth)
    #     create! do |owner|
    #         owner.password = auth['provider']
    #         owner.owner_id = auth['uid']
    #         owner.username = auth['name']
    #         owner.save
    #     end
    # end

end
