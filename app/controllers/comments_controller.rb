class CommentsController < ApplicationController
  before_action :require_signin

  def create
    @comment = @commentable.comments.new(comments_params)
    @comment.user = current_user
    if @comment.save
      flash[:success] = "Your comment has been added, #{current_user.username}!"
      redirect_to @commentable
    else
      flash[:danger] = "Your comment cannot be blank."
      redirect_to @commentable
    end
  end

  private

  def comments_params
    params.require(:comment).permit(:body)
  end
end
