class Booking < ApplicationRecord
  belongs_to :place
  belongs_to :user

  validates :checkin, :checkout, presence: true
  validates :status, inclusion: { in: [true, false] }

  def total_price
    days = (checkout - checkin).to_i
    total_price = days * place.price

    return total_price
  end
end
