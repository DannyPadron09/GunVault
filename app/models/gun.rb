class Gun < ApplicationRecord
    belongs_to :owner
    belongs_to :ammunition

    

    # validates :gun_name, uniqueness: true

    def owner_name=(name)
        self.owner = Owner.find_or_create_by(username: name)
    end

    def owner_name
        self.owner ? self.owner.name : nil
    end

end
