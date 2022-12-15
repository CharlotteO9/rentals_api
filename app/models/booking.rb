class Booking < ApplicationRecord
  belongs_to :listing
  has_many :missions, through: :listing, dependent: :destroy

  after_create_commit :first_checkin_mission
  after_create_commit :last_checkout_mission
  # après une action il faut faire quelque chose, et l'action en question c'est 'create'

  private

  def first_checkin_mission
    listing.missions.create!(
      listing_id: listing.id,
      mission_type: :first_checkin,
      date: start_date,
      price: 10 * listing.num_rooms
    )
  end

  def last_checkout_mission
    listing.missions.create!(
      listing_id: listing.id,
      mission_type: :last_checkout,
      date: end_date,
      price: 5 * listing.num_rooms
    )
  end
end
