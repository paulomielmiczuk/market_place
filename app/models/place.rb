class Place < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  
  validates :name, :location, :description, :price, presence: true
  validates :name, uniqueness: true
  validates :rating, inclusion: { in: 0..5 }
end
