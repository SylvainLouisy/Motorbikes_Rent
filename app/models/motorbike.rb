class Motorbike < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_one_attached :photo
  validates :name, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  include PgSearch::Model
  pg_search_scope :search_by_name_and_brand,
    against: [ :name, :brand ],
    using: {
    tsearch: { prefix: true } # <-- now `superman batm` will return something!
  }
end
