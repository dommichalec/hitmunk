class LinksController < ApplicationController
  before_action :require_signin, only: [:new, :create]
  # responds to GET /links
  def index
    @links = Link.order_by_popularity

    @links.each do |link|
      if current_user
        @current_vote = current_user.upvotes.find_by(link_id: link.id)
      end
    end
  end

  # responds to GET /links/new
  def new
    @link = current_user.links.new
  end

  # responds to POST /links/new
  def create
    @link = current_user.links.new(links_params)
    if @link.save # automatically calls @link.valid?
      calculate_points_for(current_user, 3)
      flash[:success] = "Boom! Your link has been successfully added."
      redirect_to links_url
    else
      render 'new' # automatically saves valid information on form
    end
  end

  # responds to GET /links/:id
  def show
    @link = Link.find_by_slug(params[:id])
  end

  def archive
    @link = Link.find_by_slug(params[:id])
    @link.archive
    flash[:success] = "#{@link.title} has been successfully archived!"
    redirect_to root_path
  end

  def unarchive
    @link = Link.find_by_slug(params[:id])
    @link.unarchive
    flash[:success] = "#{@link.title} has been successfully unarchived!"
    redirect_to root_path
  end

  private

  def links_params
    params.require(:link).permit(:title, :url)
  end
end
