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

  # if there's a session id, find the user and assign it to current_user
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    rescue ActiveRecord::RecordNotFound
  end

  # require sign in before an action is taken in the controller
  def require_signin
    unless current_user
      session[:intended_url] = request.url # stores intended URL in session
      flash[:dismissible] = "Please sign in first!"
      redirect_to signin_url
    end
  end

  # checks to see if the current user is the user captured in the params hash
  def current_user?(user)
    current_user == user
  end


  def require_correct_user
    @user = User.find_by_slug(params[:id])
    unless current_user?(@user)
      flash[:dismissible] = "You're unauthorized to edit other people's accounts."
      redirect_to root_path
    end
  end

  def logged_in?
    !current_user.nil?
  end

  def logout
    session.delete(:user_id)
    @current_user = nil
  end
end
