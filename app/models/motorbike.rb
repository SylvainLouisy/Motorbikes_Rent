class Motorbike < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_one_attached :photo
  validates :name, :address, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model
  pg_search_scope :search_by_name_and_brand_and_color_andyear_and_price_and_address,
    against: [ :name, :brand, :color, :year, :price, :address],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
