class AmmunitionsController < ApplicationController

    def index
        @owner = Owner.find(session[:user_id])
        @ammunitions = Ammunition.owners_ammo(@owner)
    end

    def show
        @owner = Owner.find(session[:user_id])
        @ammo = Ammunition.find_by(ammunition_id: params[:id])
    end

    def new
        @ammo = Ammunition.new
        @owner = Owner.find(session[:user_id])
    end

    def create
        @ammo = Ammunition.create(ammo_params)
        @ammo.owner_id = params[:owner_id]
        redirect_to owners_path
    end

    def edit
        @owner = Owner.find(session[:user_id])
        @ammo = Ammunition.owners_ammo(@owner)
    end

    def update
        byebug
        @ammo = Ammunition.find_by(ammunition_id: params[:id])
        @ammo.update(ammo_params)
        redirect_to owners_path
    end

    private

    def ammo_params
        params.require(:ammunition).permit(:caliber, :quantity, :owner_id)
    end

end