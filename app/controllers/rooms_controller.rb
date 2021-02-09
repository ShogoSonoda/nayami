class RoomsController < ApplicationController
  before_action :authenticate_user!, only: %i[show new create]

  def index
    @rooms = Room.all
  end

  def show
    @room = Room.find(params[:id])
    if @room.room_user_by?(current_user)
      @message = Message.new
      @messages = @room.messages.includes(:user).order(:id)
    else
      flash[:alert] = "ルームに参加して下さい"
      redirect_back(fallback_location: root_path)
    end
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to rooms_path
    else
      render :new
    end
  end

  private

  def room_params
    params.require(:room).permit(:name)
  end
end
