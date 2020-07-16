class GunsController < ApplicationController

    def index
        @guns = Gun.all 
    end

    def show
        @gun = Gun.find_by(gun_id: params[:id])
        @owner = Owner.find(session[:user_id])
        @all_ammo = Ammunition.owners_ammo
        @ammo = @all_ammo.guns_ammo(@gun.caliber)
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

    def edit
        @gun = Gun.find_by(gun_id: params[:id])
        @owner = Owner.find(session[:user_id])
    end

    def update
        @gun = Gun.find_by(gun_id: params[:id])
        @gun.update(gun_params)
        redirect_to owners_path
    end

    def destroy
        @gun = Gun.find_by(gun_id: params[:id])
        @gun.destroy
        flash[:notice] = "Gun Deleted"
        redirect_to owners_path
    end

    private

    def gun_params
        params.require(:gun).permit(:gun_name, :caliber, :owner_id)
    end

end
