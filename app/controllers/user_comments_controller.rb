class UserCommentsController < ApplicationController
  def new
  end

  def create
    @comment = UserComment.new(comment_params)
    @comment.author_id = current_user.id

    if @comment.save
      redirect_to user_url(@comment.commentee_id)
    else
      flash[:errors] = @comment.errors.full_messages
      redirect_to user_url(@comment.commentee_id)
    end
  end

  private
  def comment_params
    params.require(:user_comment).permit(:body, :commentee_id)
  end
end
