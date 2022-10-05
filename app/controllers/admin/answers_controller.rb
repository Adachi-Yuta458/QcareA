class Admin::AnswersController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    @answer = @question.build_answer(answer_params)
    
    ApplicationRecord.transaction do
      @answer.save!
      @question.completed!
    end
    
    redirect_to admin_question_path(@question)
  end

  private

  def answer_params
    params.require(:answer).permit(:title, :content)
  end
end
