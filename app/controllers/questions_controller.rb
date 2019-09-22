class QuestionsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @question = Question.new
    @questions = Question.all
    respond_to do |format|
      format.html
      format.json
    end
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      render json: { render: :index, status: :success }
    end
  end

  private
  def question_params
    params.require(:question).permit(:content).merge(user_id: current_user.id)
  end
end
