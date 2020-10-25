class UsersController < ApplicationController
    def index 
    end

    def new
        @user = User.new
    end
        
    def edit
    end

    def update
        if current_user.update(user_params)
            redirect_to root_path
        else
            render :edit
        end
    end

    private

    def user_params
        params.require(:user).permit(
            :name, 
            :email, 
            :password, 
            :password_confirm,
            :genre_id, 
            :grade_id, 
            :number, 
            :class_number_id
        )
    end
end
