class SessionController < ApplicationController
    skip_before_action :verified_user, only: [:new, :create]

    def new
        @owner = Owner.new 
    end

    def create
        auth = request.env["omniauth.auth"]
        if @owner = Owner.find_by(username: params[:username])
            return head(:forbidden) unless @owner.authenticate(params[:password])
            if session[:user_id] = @owner.id
                 redirect_to owner_path(@owner)
            else
                redirect_to new_owner_path
            end
        else
            @owner = Owner.find_or_initialize_by(uid: auth['uid'])
            @owner.update(username: auth['info']['name'], password: SecureRandom.hex)
            session[:user_id] = @owner.id
            redirect_to owner_path(@owner)
        end
    end

    def destroy
        session.delete("user_id")
        redirect_to root_path
    end

end