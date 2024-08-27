class PlacesController < ApplicationController
  def index
    @places = Place.all
  end
  def show
    @place = Place.find(params[:id])
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)
    if @place.save
      redirect_to_place_path(@place)
    else
      render :new
    end
  end

  private

  def place_params
    params.require(:place).permit(:name, :location, :description, :price, :user_id, :rating)
  end
end
