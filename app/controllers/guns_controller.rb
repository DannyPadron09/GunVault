class GunsController < ApplicationController

    def index
        @guns = Gun.all 
    end

    def show
        @gun = Gun.find_by(gun_id: params[:id])
        @owner = Owner.find_by(owner_id: params[:owner_id])
    end

    def new
        @gun = Gun.new
        @owner = Owner.find_by(owner_id: params[:owner_id])
    end

    def create
        @gun = Gun.new(gun_params)
        @owner = Owner.find(session[:user_id])
        if @gun.save
            redirect_to owner_path(@owner)
        else
            render 'guns/new'
        end
    end

    def edit
        @gun = Gun.find_by(gun_id: params[:id])
        @owner = Owner.find_by(owner_id: params[:owner_id])
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
        params.require(:gun).permit(:gun_name, :owner_id, :gun_id, :ammunition_id)
    end

end
