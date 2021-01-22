class AnswersController < ApplicationController
  def new
    @answer = Answer.new
    @problem = Problem.find(params[:problem_id])
  end
  
  def create
    if answer = Answer.create(answer_params)
      redirect_to problem_path(params[:problem_id])
    else
      render problem_path(params[:problem_id])
    end
  end

  private
  def answer_params
    params.require(:answer).permit(:text).merge(user_id: current_user.id, problem_id: params[:problem_id])
  end
end
