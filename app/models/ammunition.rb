class Ammunition < ApplicationRecord
    has_many :guns
    has_many :owners, through: :guns 
end
