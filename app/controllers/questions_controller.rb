class QuestionsController < ApplicationController
  before_action :find_question, only: [:show, :edit, :update, :destroy]

  def index
    @gif = JSON.parse(open(link).read)["data"]["image_url"]
    @questions = Question.all
  end

  def show
    @answers = @question.answers.all
  end

  def new
    @question =Question.new
  end

  def edit
  end

  def create
    @question =  Question.new(question_params)
    @question.author_id = current_user.id
    if @question.save
      redirect_to @question
    else
      render 'new'
    end
  end

  def update
    if @question.update(question_params)
      redirect_to @question
    else
      render 'edit'
    end
  end

  def destroy
    @question.destroy

    redirect_to questions_path
  end

  private
  def question_params
    params.require(:question).permit(:title, :body)
  end


  def find_question
    @question = Question.find(params[:id])
  end

  def link
    "http://api.giphy.com/v1/gifs/random?api_key=" + ENV["GIPHY_API_KEY"] + "&tag=puppies"
  end
end
