class Admin::QuestionsController < Admin::ApplicationController

  layout 'admin'

  def show
    @question = Question.find(params[:id])
  end

  def index
    if params[:status].present?
      @questions = current_lg.questions.where(status: params[:status])
    else
      @questions = current_lg.questions
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:title, :content)
  end
end
