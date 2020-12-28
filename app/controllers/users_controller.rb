class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @rooms = @user.rooms
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    if @profile.update()
      
    end
  end

  def follows
    @user = User.find(params[:id])
    @users = @user.followings
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers
  end

  private
  def profile_params
    params.require(:profile).permit(:project, :occupation, :position, :introduction).merge(user_id: current_user.id)
  end
end
