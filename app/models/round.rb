class Round < ApplicationRecord
  belongs_to :user
  has_many :scores, dependent: :destroy
  has_one :lunch, dependent: :destroy

  accepts_nested_attributes_for :scores
  accepts_nested_attributes_for :lunch

  validates :date, presence: true
  validates :course_name, presence: true

  validate :date_cannot_be_in_the_future

  # 日付チェック
  def date_cannot_be_in_the_future
    return if date.blank?
    if date > Date.today
      errors.add(:date, "は今日以前の日付を入力してください")
    end
  end

  # 合計スコア
  def total_score
    front = scores.find { |s| s.part == "front" }&.half_score
    back  = scores.find { |s| s.part == "back" }&.half_score
    return nil if front.nil? || back.nil?
    front + back
  end

  # 合計パット
  def total_putts
    front = scores.find { |s| s.part == "front" }&.half_putts
    back  = scores.find { |s| s.part == "back" }&.half_putts
    return nil if front.nil? || back.nil?
    front + back
  end
end
