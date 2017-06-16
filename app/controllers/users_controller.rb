class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :require_correct_user, only: [:edit, :update]

  # responds to GET /signup
  def new
    @user = User.new
  end

  # responds to GET /users
  def index
  end

  # responds to POST /users
  def create
    @user = User.new(users_params)
    if @user.save # automatically calls @user.valid?
      login(@user)
      redirect_to root_path
    else
      render 'new' # automatically saves valid information on form
    end
  end

  # responds to /users/:id
  def show
  end

  # responds to GET /users/:id/edit
  def edit
  end

  # responds to PATCH /users/:id/edit
  def update
    if @user.update_attributes(users_params)
      flash[:success] = "Nailed it! You've successfully updated your account information."
      redirect_to user_path(@user)
    else
      render 'edit' # automatically saves valid information on form
    end
  end


  private

  def set_user
    @user = User.find_by_slug(params[:id])
  end

  def users_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
