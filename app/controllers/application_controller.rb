class ApplicationController < ActionController::Base
  # This will ensure that current_user is available in all views
  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  # Ensure user is authenticated
  def authenticate_user
    unless current_user
      redirect_to login_path, alert: 'You must be logged in to access this page.'
    end
  end
end
