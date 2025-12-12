class RoundsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_round, only: [:show]

  def new
    @round = Round.new
    @round.scores.build(part: :front)
    @round.scores.build(part: :back)
  end

  def create
    @round = current_user.rounds.build(round_params)

    if @round.save
      redirect_to @round, notice: "ラウンドを登録しました！"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @rounds = current_user.rounds.order(date: :desc)
  end

  def show
  end

  private

  def set_round
    @round = current_user.rounds
                         .includes(:scores, :lunch)
                         .find(params[:id])
  end

  def round_params
    params.require(:round).permit(
      :date,
      :course_name,
      scores_attributes: [:id, :part, :half_score, :half_putts]
    )
  end
end
