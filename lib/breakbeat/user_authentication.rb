module Breakbeat
  # Code for authenticating users with the `:user_id` session property.
  # Also provides a `current_user` to find the current authenticated
  # user from anywhere in the view.
  module UserAuthentication
    def authenticate_user!
      logger.debug "Attempting to authenticate.."

      unless current_user.present?
        logger.debug "Authentication failed."
        redirect_to :index, alert: "You must be signed in." and return
      end
    end

    def current_user
      @current_user ||= User.find session[:user_id]
    rescue ActiveRecord::RecordNotFound
      nil
    end
  end
end
