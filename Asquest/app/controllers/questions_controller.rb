class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def show
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

  private
    def question_params
      params.require(:question).permit(:name, :title, :content) # Strong parameter
    end
end
