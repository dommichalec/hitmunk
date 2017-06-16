class SessionsController < ApplicationController

  # responds to GET /signin
  def new
  end

  # responds to POST /signin
  def create
    # refactor this
    user = User.find_by(username: params[:session][:username_or_email].downcase) ||
           User.find_by(email: params[:session][:username_or_email].downcase)
    if authenticated_successfully?(user)
      login(user)
      redirect_to root_url
    else
      flash.now[:danger] = "Hmm... #{$SITE_TITLE} couldn't authenicate your account with those credentials."
      render 'new'
    end
  end

  # responds to DELETE /signout
  def destroy
  end
end
