class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :motorbike
  validates :start_date, :end_date, presence: true
  attr_accessor :date_range
end
