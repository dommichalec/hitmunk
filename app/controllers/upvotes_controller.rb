class UpvotesController < ApplicationController
  before_action :require_signin, only: [:create]

  def index
    redirect_to root_path
  end

  # responds to POST /upvotes
  def create
    @link = Link.find_by(id: params[:format])
    @link.upvotes.create!(user: current_user)
    redirect_to root_path
  end
end
