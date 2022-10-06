class Admin::QuestionsController < ApplicationController
  def show
    @question = Question.find(params[:id])
  end

  def index
    if params[:status].present?
      @questions = Question.where(status: params[:status])
    else
      @questions = Question.all
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:title, :content)
  end
end
