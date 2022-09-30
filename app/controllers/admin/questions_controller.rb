class Admin::QuestionsController < ApplicationController
  def new
    @question = Question.find(params[:id])
  end

  def show
    @question = Question.find(params[:id])
  end

  def index
    @questions = Question.all
  end

  private

  def answer_params
    params.require(:answer).permit(:title, :content)
  end
end