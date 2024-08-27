class Place < ApplicationRecord
  belongs_to :user
  validates :name, :location, :description, :price, presence: true
  validates :name, uniqueness: true
  validates :rating, inclusion: { in: 0..5 }
end
