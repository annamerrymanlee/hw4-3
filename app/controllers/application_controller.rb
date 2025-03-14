class ApplicationController < ActionController::Base
  # This will ensure that current_user is available in all views
  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
