class OwnersController < ApplicationController
    skip_before_action :verified_user, only: [:new, :create]


    def index
        @owners = Owner.all 
    end

    def show
        @owner = Owner.find_by(owner_id: params[:id])
    end

    def new
        @owner = Owner.new
        @owner.guns.build(gun_name: :gun_name, caliber: :caliber)
    end

    def create
        @owner = Owner.new(owner_params)
        if @owner.save
            session[:user_id] = @owner.id
            redirect_to owner_path(@owner)
        else
            render new_owner_path 
        end
    end

    def edit
        @owner = Owner.find_by(owner_id: params[:id])
    end

    def update
        @owner = Owner.find_by(owner_id: params[:id])
        @owner.update(owner_params)
        redirect_to owner_path(@owner)
    end

    def guns_index
        @owner = Owner.find_by(owner_id: params[:id])
        @guns = @owner.all_guns
        render 'guns/index'
    end

    def gun
        @owner = Owner.find_by(owner_id: params[:id])
        @gun = Gun.find_by(gun_id: params[:gun_id])
        render 'guns/show'
    end

    def destroy
        @owner = Owner.find_by(owner_id: params[:id])
        @owner.destroy
        flash[:notice] = "Owner Deleted"
        redirect_to '/'
    end

    private

    def owner_params
        params.require(:owner).permit(:username, :password, :favorite_gun, :age, guns_attributes: [:gun_name, :id, :owner_id, :ammunition_id])
    end

end
