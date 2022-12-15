class Listing < ApplicationRecord
  has_many :bookings
  has_many :missions
  has_many :reservations
end
