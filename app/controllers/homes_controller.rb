class HomesController < ApplicationController
  before_action :authenticate_user!

  def top
    rounds = current_user.rounds.includes(:scores, :lunch)

    # スコアが入っているラウンドのみ対象
    completed_rounds = rounds.select { |r| r.total_score.present? }

    if completed_rounds.any?
      # ベストスコア（最小値）
      @best_score = completed_rounds.map(&:total_score).min

      # ベストスコアを出したラウンド（複数あり得る）
      @best_rounds = completed_rounds.select { |r| r.total_score == @best_score }

      # 表示用：代表ラウンド（最初の1件）
      @best_round = @best_rounds.first

      # 勝ち飯（ベストラウンドに紐づくランチ）
      @winning_lunches = @best_rounds.map(&:lunch).compact
    else
      @best_score = nil
      @best_round = nil
      @winning_lunches = []
    end

    # ★ TOPでは使わないが、将来のために残すならOK
    # @recent_rounds = rounds.order(date: :desc).limit(3)
  end
end
