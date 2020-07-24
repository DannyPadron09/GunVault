class AmmunitionsController < ApplicationController

    def index
        @owner = Owner.find(session[:user_id])
        if params[:refill_ammo] == "AmmoThatNeedsRefilling"
            @ammo = Ammunition.low_ammo
        else
            @ammo = @owner.ammunitions
        end
    end

    def show
        @ammo = Ammunition.find_by(ammunition_id: params[:id])
        @owner = Owner.find(session[:user_id])
    end

    def new
        @ammo = Ammunition.new
    end

    def create
        @ammo = Ammunition.new(ammo_params)
        if @ammo.save
            redirect_to ammunitions_path
        else
            render new_ammunition_path
        end
    end

    def edit
        @ammo = Ammunition.find(params[:id])
    end

    def update
        @ammo = Ammunition.find_by(ammunition_id: params[:id])
        @ammo.update(ammo_params)
        redirect_to ammunitions_path
    end

    def destroy
        @ammo = Ammunition.find_by(ammunition_id: params[:id])
        @ammo.destroy
        flash[:notice] = "Ammo has been Deleted"
        redirect_to ammunitions_path
    end

    private

    def ammo_params
        params.require(:ammunition).permit(:caliber, :quantity)
    end

end
