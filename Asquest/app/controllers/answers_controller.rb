class AnswersController < ApplicationController
  
  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new
    if @answer.update(answer_params)
      redirect_to question_path(@question), notice: 'Success!'
    else
      redirect_to question_path(@question), alert: 'Invaild!'
    end

  end

  def edit
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
  end

  def update
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
    if @answer.update(answer_params)
      redirect_to question_path(@question), notice: 'Success!'
    else
      flash[:alert] = 'Invaild!'
      render 'Edit'
    end
  end
  private
    def answer_params
      params.require(:answer).permit(:content, :name, :question_id)
    end
end
