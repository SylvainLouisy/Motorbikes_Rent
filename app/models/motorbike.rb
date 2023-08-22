class Motorbike < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_many_attached :photos
  validates :name, presence: true
end
