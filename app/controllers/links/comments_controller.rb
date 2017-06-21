class Links::CommentsController < CommentsController
  before_action :set_commentable

  def index
    redirect_to root_path
  end

  private

  def set_commentable
    @commentable = Link.find_by_slug(params[:link_id])
  end
end
