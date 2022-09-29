class Admin::QuestionsController < ApplicationController
  def new; end

  def edit; end

  def show; end

  def index
    @questions = Question.all
  end
end
