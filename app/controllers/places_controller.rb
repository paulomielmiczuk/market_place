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

  def my_places
    @places = Place.all
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
  private

  def place_params
    params.require(:place).permit(:name, :location, :description, :price, :user_id, :rating)
  end
end
