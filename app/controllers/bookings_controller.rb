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
    @booking = Booking.find(params[:id])
    if @booking.update(booking_params)
      render json: { status: 'success' }, status: :ok
    else
      render json: { status: 'error' }, status: :unprocessable_entity
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
