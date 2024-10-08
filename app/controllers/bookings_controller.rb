class BookingsController < ApplicationController
  def index
    @bookings = Booking.joins(:place).where.not(places: { user_id: current_user.id })
  end

  def new
    @place = Place.find(params[:place_id])
    @booking = Booking.new
  end

  def create
    @place = Place.find(params[:place_id])
    @booking = Booking.new(booking_params)
    @booking.place = @place
    @booking.user = current_user
    @booking.status = false
    if @booking.save
      redirect_to bookings_path
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def requests
    places = Place.where(user: current_user)
    @bookings = Booking.where(place: places)
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy!
    redirect_to request.referer || places_path
  end

  def update
    @booking = Booking.find(params[:id])
    respond_to do |format|
      if @booking.update(status: true)
        format.html { redirect_to requests_path }
      end
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:checkin, :checkout)
  end
end
