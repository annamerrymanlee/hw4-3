class UsersController < ApplicationController
  # Display the signup form with a new user object
  def new
    @user = User.new
  end

  # Process the new user creation
  def create
    @user = User.new(user_params)

    if @user.save
      # Redirect to login page with success message
      redirect_to login_path, notice: 'Your account has been successfully created. Please log in.'
    else
      # Log the error messages and render the signup form again with error messages
      log_signup_errors(@user)
      flash.now[:alert] = 'There was an issue with your sign-up. Please check your input.'
      render :new
    end
  end

  private

  # Only allow the specified user attributes to be passed
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  # Log the user validation errors for better debugging
  def log_signup_errors(user)
    # Logs all validation errors for debugging purposes
    Rails.logger.error "User sign-up failed: #{user.errors.full_messages.join(', ')}"
  end
end

