class ProblemsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit update destroy]
  before_action :set_problem, only: %i[show edit update destroy user_check]
  before_action :user_check, only: %i[edit update destroy]

  def new_guest
    user = User.find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end

  def index
    @problems = Problem.includes(:user).order('created_at DESC')
  end

  def new
    @problem = Problem.new
  end

  def create
    @problem = Problem.new(problem_params)
    if @problem.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @answer = Answer.new
    @answers = @problem.answers.includes(:user)
  end

  def edit; end

  def update
    if @problem.update(problem_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @problem.destroy
    redirect_to root_path
  end

  def search_problem
    @search = Problem.ransack(params[:q])
    @results = @search.result
  end

  private

  def problem_params
    params.require(:problem).permit(:title, :text).merge(user_id: current_user.id)
  end

  def set_problem
    @problem = Problem.find(params[:id])
  end

  def user_check
    redirect_to root_path if current_user.id != @problem.user_id
  end
end
