class Motorbike < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_one_attached :photo
  validates :name, presence: true
end
