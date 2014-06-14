class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include Iceburn::Filters

  protected
  def authenticate_user!
    unless current_user.present?
      redirect_to 'application#index', alert: "You must be signed in." and return
    end
  end

  def current_user
    @current_user ||= User.find session[:user_id]
  end
end
