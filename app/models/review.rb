class Review < ApplicationRecord
  belongs_to :motorbike
  validates  :content, :rating, presence: true
end
