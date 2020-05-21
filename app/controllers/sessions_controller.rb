class SessionsController < ApplicationController

    def create
        @user = User.find_by(name: params[:name])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to :create
        else
            flash[:notice] = "Incorrect Password"
            redirect_to "/new"
        end
    end

end
