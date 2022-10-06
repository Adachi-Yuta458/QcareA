class Admin::QuestionsController < Admin::ApplicationController

  layout 'admin'

  def show
    @question = Question.find(params[:id])
  end

  def index
    @questions = current_lg.questions
    @questions = @questions.where(status: params[:status]) if params[:status].present?
  end

  private

  def answer_params
    params.require(:answer).permit(:title, :content)
  end
end
