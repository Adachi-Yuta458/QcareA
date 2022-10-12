# frozen_string_literal: true

class QuestionsController < ApplicationController
  def index
    @question = Question.new
    @questions = Question.all
  end

  def create
    @question = Question.new(question_params)
    @question.attachment = params[:question][:attachment]

    #市町村選択機能は、職員登録機能実装時に作成するため、今は仮のIDを入力
    @question.local_government_id = 4
    #介護施設選択機能は、職員登録機能実装時に作成するため、今は仮のIDを入力
    @question.nursing_facility_id = 1
    
    ApplicationRecord.transaction do
      @question.save!
      @question.wait!
    end
    
    redirect_to questions_url, notice: "「#{@question.title}」を投稿しました。"
  end

  private

  def question_params
    params.require(:question).permit(:service, :title, :content, :status, :attachment)
  end
end
