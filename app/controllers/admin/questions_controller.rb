class Admin::QuestionsController < ApplicationController

  layout 'admin'

  def show
    @question = Question.find(params[:id])
  end

  def index
    if params[:status].present?
      @questions = Question.where(status: params[:status], local_government_id: current_lg)
    else
      @questions = Question.where(local_government_id: current_lg.id)
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:title, :content)
  end
end
