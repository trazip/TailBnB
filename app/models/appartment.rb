class Appartment < ApplicationRecord
  include PgSearch::Model
  belongs_to :user

  def available?(from, to)
    bookings.where('start_booking <= ? AND end_booking >= ?', to, from).none?
  end
end
