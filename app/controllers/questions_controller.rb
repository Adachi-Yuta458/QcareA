# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :login_required

  def index
    @question = Question.new
    @questions = current_staff.nursing_facility.questions
    @questions = @questions.where(service: params[:service]) if params[:service].present?
    @questions = @questions.where(status: params[:status]) if params[:status].present?
  end

  def create
    @question = Question.new(question_params)
    @question.attachment = params[:question][:attachment]

    @question.local_government_id = current_staff.nursing_facility.local_government_id
    @question.nursing_facility_id = current_staff.nursing_facility.id
    
    ApplicationRecord.transaction do
      @question.save!
      @question.wait!
    end
    
    redirect_to questions_url, notice: "「#{@question.title}」を投稿しました。"
  end

  private

  def question_params
    params.require(:question).permit(:service, :title, :content, :status, :attachment, :categories => [])
  end

  def login_required
    redirect_to login_path unless current_staff
  end
end
