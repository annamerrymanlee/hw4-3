class EntriesController < ApplicationController
  before_action :authenticate_user  # Ensure the user is logged in
  before_action :set_place, only: [:new, :create]
  before_action :set_entry, only: [:show]

  # Display the form for creating a new entry for a specific place
  def new
    @entry = @place.entries.build  # Build a new entry for the current place
  end

  # Create a new entry and associate it with a place
  def create
    @entry = @place.entries.build(entry_params)  # Build a new entry for the place
    @entry.user = current_user  # Associate the current user with the entry

    if @entry.save  # Save the entry and check if it was successful
      redirect_to place_path(@place), notice: 'Entry was successfully created.'  # Redirect on success
    else
      flash.now[:alert] = 'There was an issue creating the entry.'  # Show an alert on failure
      render :new  # Re-render the new entry form
    end
  end

  private

  # Strong parameters for entry
  def entry_params
    params.require(:entry).permit(:title, :description, :occurred_on, :uploaded_image)
  end

  # Set the place for new or create actions (already done in the before_action)
  def set_place
    @place = Place.find(params[:place_id])  # Find the place by place_id
  end

  # Set the entry for the show action
  def set_entry
    @entry = Entry.find(params[:id])  # Find the entry by its ID
  end
end
