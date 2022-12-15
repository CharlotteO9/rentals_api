class Reservation < ApplicationRecord
  belongs_to :listing
  has_many :missions, through: :listing, dependent: :destroy

  after_create_commit :checkout_checkin_mission

  private

  def checkout_checkin_mission
    return if listing.missions.find_by(mission_type: :last_checkout, date: end_date)

    # on aurait pu mettre des self.listing_id etc
    listing.missions.create!(
      listing_id: listing.id,
      mission_type: :checkout_checkin,
      date: end_date,
      price: 10 * listing.num_rooms
    )
  end
end
