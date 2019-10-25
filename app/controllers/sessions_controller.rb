class SessionsController < ApplicationController
    skip_before_action :authenticate_login, except: [:logout]
    def new
    end
    def logout
        session[:user_id] = nil
        redirect_to "/"
    end
    def create
        @user = User.find_by_email(params[:email])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to songs_path
        else
            flash[:errors] = {:Login_Attempt =>["Invalid Email/Password Combination"]}
            redirect_to "/"
        end
    end
end
