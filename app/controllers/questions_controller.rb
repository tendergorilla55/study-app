class QuestionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:index, :show]

  def index
    @question = Question.new
    @questions = Question.all.order(created_at: "DESC")
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

  def show
    @question = Question.find(params[:id])
    respond_to do |format|
      format.html
      format.json
    end
  end

  private
  def set_user
    @user = current_user
  end

  def question_params
    params.require(:question).permit(:title, :content).merge(user_id: current_user.id)
  end
end
