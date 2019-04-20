class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy] #指定したアクションが実行される前に"set_question"メソッドを実行
  def index
    @questions = Question.all
  end

  def show
    @answer = Answer.new
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to root_path, notice: 'Success!'
    else
      flash[:alert] = 'Save Error!'
      render :new
    end
  end

  def edit
  end

  def update
    if @question.update(question_params)
      redirect_to root_path, notice: 'Success!'
    else
      flash[:alert] = 'Save Error!'
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to root_path, notice: 'Success!'
  end

  private
    def set_question
      @question = Question.find(params[:id])
    end

  private
    def question_params
      params.require(:question).permit(:name, :title, :content) # Strong parameter
    end
end
