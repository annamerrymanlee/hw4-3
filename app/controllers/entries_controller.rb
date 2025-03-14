class EntriesController < ApplicationController
  before_action :authenticate_user
  before_action :set_place, only: [:new, :create]
  before_action :set_entry, only: [:show]

  # Display the form for creating a new entry for a specific place
  def new
    @entry = @place.entries.build
  end

  # Create a new entry and associate it with a place
  def create
    @entry = @place.entries.build(entry_params)
    @entry.user = current_user  # Associate the current user with the entry

    if @entry.save
      redirect_to place_path(@place), notice: 'Entry was successfully created.'
    else
      flash.now[:alert] = 'There was an issue creating the entry.'
      render :new
    end
  end

  private

  # Set the place for new and create actions
  def set_place
    @place = Place.find(params[:place_id])
  end

  # Set the entry for show action
  def set_entry
    @entry = Entry.find(params[:id])
  end

  # Strong parameters for entry form submission
  def entry_params
    params.require(:entry).permit(:title, :description, :occurred_on, :image)  # Make sure to permit the image attribute
  end

  # Ensure a user is authenticated
  def authenticate_user
    redirect_to login_path, alert: 'You must be logged in to create an entry.' unless session[:user_id]
  end

  # Get the current logged-in user
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
