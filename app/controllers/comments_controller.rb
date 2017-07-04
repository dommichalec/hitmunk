class CommentsController < ApplicationController
  before_action :require_signin

  def index
    @comments = Comment.all
  end

  def create
    @comment = @commentable.comments.new(comments_params)
    @comment.user = current_user
    if @comment.save
      calculate_points_for(@comment.user, 1)
      flash[:success] = "Your comment has been added, #{@comment.user.username}!"
      redirect_to @commentable
    else
      redirect_to @commentable
    end
  end

  def report
    # generate_report()
    CommentWorker.perform_async("01-01-2017", "12-31-2017")
    render text: "REQUEST TO GENERATE A COMMENT ADDED TO QUEUE"
  end

  private

  def comments_params
    params.require(:comment).permit(:body)
  end
end
