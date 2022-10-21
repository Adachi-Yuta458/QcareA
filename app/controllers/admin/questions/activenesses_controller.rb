class Admin::Questions::ActivenessesController < Admin::ApplicationController

  layout 'admin'

  def create
    @question = current_lg.questions.find(params[:question_id])
    @question.working!
    
    redirect_to admin_question_path(@question)
  end
end