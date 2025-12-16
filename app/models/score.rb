class Score < ApplicationRecord
  belongs_to :round

  enum part: {
    front: 0,
    back: 1
  }

  validates :part, presence: true
  validates :half_score, numericality: { only_integer: true, allow_nil: true }
  validates :half_putts, numericality: { only_integer: true, allow_nil: true }
end
