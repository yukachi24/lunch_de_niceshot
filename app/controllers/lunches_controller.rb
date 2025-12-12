class LunchesController < ApplicationController
  before_action :authenticate_user!

  def new
    @lunch = Lunch.new(round_id: params[:round_id])
  end

  def create
    @lunch = Lunch.new(lunch_params)

    if @lunch.save
      redirect_to round_path(@lunch.round), notice: "ランチを登録しました！"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def lunch_params
    params.require(:lunch).permit(:comment, :image, :round_id)
  end
end
