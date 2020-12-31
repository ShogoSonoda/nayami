class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:mypage, :edit, :update]
  before_action :set_user, only: [:show, :edit, :update, :follows, :followers]
  before_action :create_searching_object, only: [:index, :search_user]

  def index
    @users = User.all.order("created_at DESC")
  end

  def mypage
    redirect_to user_path(current_user)
  end

  def show
    @rooms = @user.rooms
  end

  def edit
    unless @user == current_user
      redirect_to user_path(@user)
    end
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

  def search_user
    @results = @p.result
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.fetch(:user, {}).permit(:name, :email, :industry_id, :occupation_id, :position_id, :introduction, :image)
  end

  def create_searching_object
    @p = User.ransack(params[:q])
  end
end
