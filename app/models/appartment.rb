class Appartment < ApplicationRecord
  belongs_to :user
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def available?(from, to)
    bookings.where('start_booking <= ? AND end_booking >= ?', to, from).none?
  end
end
