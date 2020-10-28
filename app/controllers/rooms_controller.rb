class RoomsController < ApplicationController


    def index

    end

    def new
        @room = Room.new
        @room.room_users.build
    end

    def create
        @room = Room.new(room_params)
        if @room.room_users.build
            # binding.pry
            redirect_to root_path
        else
            redirect_to new_room_path
        end
    end

    def destroy
        room = Room.find(params[:id])
        room.destroy
        redirect_to root_path
    end

    private

    def room_params
        params.require(:room).permit(:name, {user_ids_attributes: []}, room_users_attributes:[:room_id])
    end

end
