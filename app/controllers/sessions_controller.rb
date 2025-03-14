class SessionsController < ApplicationController
  # Show the login form
  def new
  end

  # Handle the login process
  def create
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to places_path, notice: 'Successfully logged in.'
    else
      flash.now[:alert] = 'Invalid email or password. Please try again.'
      render :new
    end
  end

  # Handle user logout
  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'Successfully logged out.'  # Redirect to the root path (home page) after logout
  end
end
