class QuestionsController < ApplicationController
  before_action :require_signin, only: [:new, :create]
  before_action :set_question, only: [:new]

  def index
    @questions = Question.order_by_popularity
  end

  def new
  end

  def create
    @question = current_user.questions.new(questions_params)
    if @question.save
      calculate_points_for(current_user, 3)
      flash[:success] = "Your question has been added successfully, #{current_user.username}"
      redirect_to questions_path(@question)
    else
      render 'new'
    end
  end

  def show
    @question = Question.find_by_slug(params[:id])
  end

  private

  def set_question
    @user = current_user
    @question = @user.questions.new
  end

  def questions_params
    params.require(:question).permit(:title, :body)
  end
end
