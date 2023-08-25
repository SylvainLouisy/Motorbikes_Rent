class Review < ApplicationRecord
  belongs_to :motorbike
  belongs_to :user

  validates  :content, :rating, presence: true

  validates :rating, numericality: { only_integer: true }, inclusion: { in: 0..5 }
end
