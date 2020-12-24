class MessagesController < ApplicationController
  def index
  end

  def create
    room = Room.find(params[:room_id])
    if message = room.messages.create(message_params)
      redirect_to room_path(room.id)
    end
  end

  private
  def message_params
    params.require(:message).permit(:content).merge(user_id: current_user.id)
  end
end
