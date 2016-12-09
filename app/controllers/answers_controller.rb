class AnswersController < ApplicationController
  before_action :find_question

  def new
    @answer = Answer.new
  end

  def create
    @answer = @question.answers.new(answer_params)
    @answer.user_id = current_user.id
    if @answer.save
      redirect_to question_path(@question)
    else
      render 'new'
    end
  end

  def destroy
    @answer = @question.answers.find(params[:id])
    @answer.destroy
    redirect_to question_path(@question)
  end

  private
    def answer_params
      params.require(:answer).permit(:body)
    end

    def find_question
      @question = Question.find(params[:question_id])
    end
end
