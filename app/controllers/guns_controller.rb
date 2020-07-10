class GunsController < ApplicationController

    def index
        @guns = Gun.all 
    end

    def show
        @gun = Gun.find_by(gun_id: params[:id])
        @owner = Owner.find(session[:user_id]) 
    end

    def new
        @gun = Gun.new
        @owner = Owner.find(session[:user_id])
    end

    def create
        gun = Gun.new(gun_params)
        if gun.save
            redirect_to owners_path
        else
            render 'guns/new'
        end
    end

    private

    def gun_params
        params.require(:gun).permit(:gun_name, :caliber, :ammo_quantity, :owner_id)
    end

end
