class Score < ApplicationRecord
  belongs_to :round

  validates :part, presence: true
  validates :half_score, numericality: { only_integer: true, allow_nil: true }
  validates :half_putts, numericality: { only_integer: true, allow_nil: true }
end
