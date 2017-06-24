class UpvotesController < ApplicationController
  before_action :require_signin, only: [:create]

  def index
    redirect_to root_path
  end

  # responds to POST /upvotes
  def create
    @link = Link.find_by_slug(params[:format])
    @link.upvotes.create!(user: current_user)
    calculate_points_for(current_user, 1)
    redirect_to root_path
  end
end
