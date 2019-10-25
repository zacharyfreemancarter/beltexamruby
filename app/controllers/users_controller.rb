class UsersController < ApplicationController
    skip_before_action :authenticate_login, except: [:show]
    def create
        @user =  User.create(user_params)
        if @user.valid?
            session[:user_id] = @user.id
            redirect_to "/songs"
        else
            flash[:errors] = @user.errors
            puts @user.errors.messages
            redirect_to "/"
        end
    end
    def show
        @user = User.find(params[:id])
    end
    private
    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :password)
    end
end
