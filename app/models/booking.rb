class Booking < ApplicationRecord
  belongs_to :place
  belongs_to :user

  validates :checkin, :checkout, :status, presence: true
end
