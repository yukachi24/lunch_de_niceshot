class Lunch < ApplicationRecord
  belongs_to :round
  has_one_attached :image

  validates :comment, presence: true, length: { maximum: 300 }
end
