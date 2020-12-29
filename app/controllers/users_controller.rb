class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def index
    @users = User.all
  end

  def show
    @rooms = @user.rooms
  end

  def edit
    if @user.profile.present?
      @profile = Profile.find(params[:id])
    else
      @profile = Profile.new
    end
  end

  def update
    if @user.profile.update(profile_params)
      redirect_to user_path(current_user.id)
    else
      render :edit
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

  def set_user
    @user = User.find(params[:id])
  end
end
