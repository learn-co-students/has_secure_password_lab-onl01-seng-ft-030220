class SessionsController < ApplicationController
    
    def create
        @user = User.find_by(name: params[:user][:name])
        if !params[:user][:password].present? || !@user.authenticate(params[:user][:password])
            redirect_to sessions_path
        else
            session[:user_id] = @user.id
        end
    end
end