class UsersController < ApplicationController
    def new 
        @user = User.new
    end
    def create 
        user = User.new(user_params)

        if @user.save
          redirect_to new_user_path
        else
          render :new, status: :unprocessable_entity
        end
    end
    def edit
        @user = User.find(params[:id])
      end
    
      def update
        @user = User.find(params[:id])
        if @user.update(user_params)
          redirect_to @user, notice: 'User was successfully updated.'
        else
          render :edit
        end
      end
    def user_params
        # Implement this method to permit and require the proper fields
        params.require(:user).permit(:username, :email, :password)
      end
end
