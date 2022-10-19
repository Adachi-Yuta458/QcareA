class Admin::QuestionsController < Admin::ApplicationController

  layout 'admin'

  def show
    @question = current_lg.questions.find(params[:id])
  end

  def index
    @questions = current_lg.questions.order(created_at: :desc)
    @questions = @questions.where(status: params[:status]).order(created_at: :desc) if params[:status].present?
  end

  private

  def answer_params
    params.require(:answer).permit(:title, :content)
  end
end
