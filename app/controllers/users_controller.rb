class UsersController < ApplicationController
  before_action :authenticate_user!, only: %i[mypage edit update user_problems user_rooms]
  before_action :set_user, only: %i[show edit update follows followers user_problems user_rooms]
  before_action :create_searching_object, only: %i[index search_user]

  def mypage
    redirect_to user_path(current_user)
  end

  def show
    @rooms = @user.rooms
  end

  def edit
    redirect_to user_path(@user) unless @user == current_user
  end

  def update
    if current_user.update(user_params)
      redirect_to user_path(current_user)
    else
      redirect_to edit_user_path(current_user)
    end
  end

  def follows
    @users = @user.followings
  end

  def followers
    @users = @user.followers
  end

  def search_user; end

  def index
    @search_user_results = @search_user.result
  end

  def user_problems
    @problems = @user.problems
  end

  def user_rooms
    @rooms = @user.rooms
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.fetch(:user, {}).permit(:name, :email, :industry_id, :occupation_id, :position_id, :introduction, :image)
  end

  def create_searching_object
    @search_user = User.ransack(params[:q])
  end
end
