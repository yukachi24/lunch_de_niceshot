class RoundsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_round, only: [:show, :edit, :update, :destroy]

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
      # バリデーションエラー時も入力欄を維持
      @round.scores.build(part: :front) if @round.scores.none?(&:front?)
      @round.scores.build(part: :back)  if @round.scores.none?(&:back?)

      render :new, status: :unprocessable_entity
    end
  end

  def index
    @rounds = current_user.rounds.order(date: :desc)
  end

  def show
  end

  def edit
    # 表示のみ
  end

  def update
    if @round.update(round_params)
      redirect_to @round, notice: "ラウンドを更新しました！"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    # ★ Render本番での外部キー制約対策
    # round_id に紐づく Lunch が複数存在しても必ず削除する
    Lunch.where(round_id: @round.id).destroy_all

    # scores は dependent: :destroy で消えるが、明示しても安全
    # Score.where(round_id: @round.id).destroy_all

    @round.destroy
    redirect_to root_path, notice: "ラウンドを削除しました"
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
