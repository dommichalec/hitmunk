class LinksController < ApplicationController
  before_action :require_signin, only: [:new, :create]
  # responds to GET /links
  def index
    @links = Link.all

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
      calculate_points_for(current_user, 2)
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

  private

  def links_params
    params.require(:link).permit(:title, :url)
  end
end
