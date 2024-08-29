class Place < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  has_one_attached :photo

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  validates :name, :location, :description, :price, presence: true
  validates :name, uniqueness: true
  validates :rating, inclusion: { in: 0..5 }

  include PgSearch::Model
  pg_search_scope :search_by_name_and_location,
  against: %I[name location], using: { tsearch: { prefix: true } }
end
