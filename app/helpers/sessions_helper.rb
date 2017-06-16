module SessionsHelper

  # log in a user and give persistence to session with a user id
  def login(user)
    flash[:success] = "Bingo! You're all set, #{user.username}."
    session[:user_id] = user.id
  end

  # make sure user exists and password authentication returns true
  def authenticated_successfully?(user)
    user && user.authenticate(params[:session][:password])
  end
end
