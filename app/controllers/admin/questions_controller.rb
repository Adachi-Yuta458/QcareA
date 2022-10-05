class Admin::QuestionsController < ApplicationController
  def show
    @question = Question.find(params[:id])
  end

  def index
    if params[:status].nil? || params[:status].empty?
      @questions = Question.all
    else
      @questions = Question.where(status: params[:status])
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:title, :content)
  end
end
