# frozen_string_literal: true

class QuestionsController < ApplicationController
  def index
    @question = Question.new
    @questions = Question.all
  end

  def create
    @question = Question.new(question_params)
    @question.attachment = params[:question][:attachment]

    #市町村選択機能は、介護施設ログイン機能実装時に作成するため、今は仮の市町村IDを入力
    @question.local_government_id = 4
    
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
