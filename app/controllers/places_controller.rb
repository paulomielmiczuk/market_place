class PlacesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index]

  def index
    @places = Place.all
    if params[:query].present?
      @places = @places.search_by_name_and_location(params[:query])
    end

    @markers = @places.geocoded.map do |place|
      {
        lat: place.latitude,
        lng: place.longitude
      }
    end
  end

  def show
    @place = Place.find(params[:id])
    @marker = [{
      lat: @place.latitude,
      lng: @place.longitude,
      marker_html: render_to_string(partial: "marker")
    }]
    @booking = Booking.new
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)
    @place.user = current_user
    @place.rating = 3.0
    if @place.save
      redirect_to place_path(@place)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @place = Place.find(params[:id])
  end

  def update
    @place = Place.find(params[:id])
    if @place.update(place_params)
      redirect_to @place, notice: 'Place updated!'
    else
      render :edit
    end
  end

  def destroy
    @place = Place.find(params[:id])
    @place.destroy!
    redirect_to places_path
  end

  def my_places
    @my_places = Place.where(user: current_user)
  end

  private

  def place_params
    params.require(:place).permit(:name, :location, :description, :price, :rating, :photo)
  end
end
