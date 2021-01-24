class RoomUsersController < ApplicationController
  def create
    room_user = current_user.room_users.build(room_id: params[:room_id])
    room_user.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    room_user = RoomUser.find_by(room_id: params[:room_id], user_id: current_user.id)
    room_user.destroy
    redirect_back(fallback_location: root_path)
  end
end
