class PlacesController < ApplicationController
  before_action :set_place, only: [:show]

  # Display all places
  def index
    @places = Place.all
  end

  # Show a specific place and its associated entries
  def show
    @entries = @place.entries  # Use association rather than raw SQL
  end

  # Display the form to create a new place
  def new
    @place = Place.new
  end

  # Create a new place
  def create
    @place = Place.new(place_params)

    if @place.save
      redirect_to places_path, notice: 'Place was successfully created.'
    else
      flash.now[:alert] = 'There was an issue creating the place.'
      render :new
    end
  end

  private

  # Set the place for show action (using Rails convention)
  def set_place
    @place = Place.find(params[:id])
  end

  # Strong parameters to permit only allowed attributes
  def place_params
    params.require(:place).permit(:name)
  end
end
