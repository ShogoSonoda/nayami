class ProblemsController < ApplicationController
  before_action :set_problem, only: [:edit, :update]

  def index
    @problems = Problem.includes(:user).order("created_at DESC")
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

  def edit
    
  end

  def update
    if @problem.update(problem_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private
  def problem_params
    params.require(:problem).permit(:title, :text).merge(user_id: current_user.id)
  end

  def set_problem
    @problem = Problem.find(params[:id])
  end
end
