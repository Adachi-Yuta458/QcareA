class Admin::QuestionsController < ApplicationController
  def show
    @question = Question.find(params[:id])
  end

  def index
    @questions = Question.all
  end

  def search
    if params[:status].empty?
      @questions = Question.all
    else
      @questions = Question.where(status: params[:status])
    end
    render :index
  end

  private

  def answer_params
    params.require(:answer).permit(:title, :content)
  end
end
