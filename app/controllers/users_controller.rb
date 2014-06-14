class UsersController < ApplicationController
  before_action :find_user, except: %w(index create login logout)
  before_action :authenticate_user!, :except => %w(login)

  def index
    @users = User.where search_params
    respond_with @users
  end

  def create
    @user = User.new edit_params

    if @user.save
      respond_with @user
    else
      render json: { errors: @user.errors }
    end
  end

  def show
    respond_with @user
  end

  # Log in a user by their email and plaintext password.
  def login
    @user = User.where(email: params[:user][:email]).first

    if @user.present? && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      render status: 200, notice: "Signed in successfully"
    else
      render status: 401, alert: "Error signing in"
    end
  end

  # Log out the current user if there is one.
  def logout
    session[:user_id] = nil
    redirect_to :index, notice: "Signed out successfully"
  end

  def update
    if @user.update edit_params
      respond_with @user
    else
      render json: { errors: @user.errors }
    end
  end

  def destroy
    if @user.destroy
      respond_with @user
    else
      render json: { errors: @user.errors }
    end
  end

  private
  def find_user
    @user = User.find params[:id]
  end

  def edit_params
    params.require(:user).permit :email, :password, :password_confirmation
  end

  def search_params
    params.permit :email
  end
end
