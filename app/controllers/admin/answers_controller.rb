class Admin::AnswersController < Admin::ApplicationController

  layout 'admin'

  def create
    @question = current_lg.questions.find(params[:question_id])

    if params[:update]
      @answer = @question.build_answer(answer_params)

      ApplicationRecord.transaction do
        @answer.save!
        @question.completed!
      end
    else
      @question.working!
    end
    
    redirect_to admin_question_path(@question)
  end

  private

  def answer_params
    params.require(:answer).permit(:title, :content)
  end
end
