class BookingsController < ApplicationController
  before_action :set_booking, only: %i[update]

  def index
    @bookings = Booking.all
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
    @booking.status = true
    if @booking.save
      redirect_to bookings_path
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def requests
    @bookings = Booking.where(user: current_user)
  end

  def update
    if @booking.update(booking_params)
      redirect_to requests_path, notice: 'Booking confirmed successfully.'
    else
      redirect_to requests_path, alert: 'Failed to confirm booking.'
    end
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:checkin, :checkout, :status)
  end
end
