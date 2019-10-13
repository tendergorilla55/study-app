class QuestionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:index, :show]

  def index
    @question = Question.new
    questions = Question.all.order(created_at: "DESC")
    respond_to do |format|
      format.html
      format.json { render json: questions, include: [:user] }
    end
  end

  def create
    question = Question.new(question_params)
    if question.save
      render json: { render: :index, status: :success }
    else
      render json: { render: :index }
    end
  end

  def show
    @question = Question.find(params[:id])
    @answers = Answer.where(question_id: params[:id]).order(created_at: "DESC")
    @answer = Answer.new
    respond_to do |format|
      format.html
      format.json
    end
  end

  def answer
    answer = Answer.new(answer_params)
    if answer.save
      render json: { render: show, status: :success }
    end
  end

  private
  def set_user
    @user = current_user
  end

  def question_params
    params.require(:question).permit(:title, :content).merge(user_id: current_user.id)
  end

  def answer_params
    params.require(:answer).permit(:text, :question_id).merge(user_id: current_user.id)
  end
end
