class AmmunitionsController < ApplicationController

    def index
        @owner = Owner.all 
        @ammunitions = Ammunition.all 
    end

    def show
        @ammo = Ammunition.find(params[:id])
    end

    def new
        @ammo = Ammunition.new 
    end

    def create
        @ammo = Ammunition.create(ammo_params)
        @ammo.owner_id = params[:owner_id]
        redirect_to owners_path
    end

    private

    def ammo_params
        params.require(:ammunition).permit(:caliber)
    end

end