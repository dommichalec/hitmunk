class LinksController < ApplicationController

  # responds to GET /links
  def index
    @links = Link.all
  end

  # responds to GET /links/new
  def new
    @link = Link.new
  end

  # responds to POST /links/new
  def create
    @link = Link.new(links_params)
    if @link.save # automatically calls @link.valid?
      flash[:success] = "Boom! Your link has been successfully added."
      redirect_to links_url
    else
      render 'new' # automatically saves valid information on form
    end
  end

  private

  def links_params
    params.require(:link).permit(:title, :url)
  end
end
