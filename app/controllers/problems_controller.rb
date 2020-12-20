class ProblemsController < ApplicationController
  def index
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

  private
  def problem_params
    params.require(:problem).permit(:title, :text).merge(user_id: current_user.id)
  end
end
