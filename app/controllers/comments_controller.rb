class CommentsController < ApplicationController
  before_action :find_question

  def new
    @comment = Comment.new
  end

  def create
    @comment = @question.comments.new(comment_params)
    @comment.commenter_id = current_user.id
    @comment.commentable_id = @question.id
    @comment.commentable_type = "Question"
    if @comment.save
      redirect_to question_path(@question)
    else
      render 'new'
    end
  end

  def destroy
    @comment = @question.comments.find(params[:id])
    @comment.destroy
    redirect_to question_path(@question)
  end


  private
    def comment_params
      params.require(:comment).permit(:body)
    end

    def find_question
      @question = Question.find(params[:question_id])
    end
end
