class BookingsController < ApplicationController
  def index
    @bookings = bookings.all
  end
end
