class HomesController < ApplicationController
  before_action :authenticate_user!

  def top
    rounds = current_user.rounds.includes(:scores, :lunch)

    completed_rounds = rounds.select { |r| r.total_score.present? }

    if completed_rounds.any?
      @best_score = completed_rounds.map(&:total_score).min
      @best_rounds = completed_rounds.select { |r| r.total_score == @best_score }
      @winning_lunches = @best_rounds.map(&:lunch).compact
    else
      @best_score = nil
      @winning_lunches = []
    end

    @recent_rounds = rounds.order(date: :desc).limit(3)
  end
end
