class UsersController < ApplicationController

    def new
        @users = User.new
        render :new
    end

    def show
        @user = User.find(params[:id])
        render :show
    end

    def create
        @user = User.new(user_params)
        if @user.save
            # session[:session_token] = @user.reset_session_token!
            login_user!
            redirect_to user_url(@user)
        else
            flash.now[:errors] = @user.errors.full_messages 
            
            render :new
        end
    end



    def user_params
        params.require(:user).permit(:email,:password)
end

end