class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end
  
  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    @room.user_ids = current_user.id
    if @room.save
      redirect_to rooms_path
    else
      render :new
    end
  end

  def show
    
  end

  private
  def room_params
    params.require(:room).permit(:name)
  end
end
