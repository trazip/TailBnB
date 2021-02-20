class Appartment < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :photo
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def available?(appartment, start_date, end_date)
    appartment.bookings.each do |b|
      return false if (b.start_date..b.end_date).overlaps?(start_date.to_date..end_date.to_date)
    end
    true
  end
end
