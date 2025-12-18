# app/controllers/lunches_controller.rb
class LunchesController < ApplicationController

  def new
    @round = Round.find(params[:round_id])
    @lunch = Lunch.new
  end

  def create
    @round = Round.find(params[:round_id])
    @lunch = Lunch.new(lunch_params)
    @lunch.round = @round

    if @lunch.save
      redirect_to round_path(@lunch.round_id), notice: "ランチを登録しました"
    else
      render :new
    end
  end

  def edit
    @lunch = Lunch.find(params[:id])
    @round = @lunch.round
  end

  def update
    @lunch = Lunch.find(params[:id])
    @round = @lunch.round

    if @lunch.update(lunch_params)
      redirect_to round_path(@round), notice: "ランチを更新しました"
    else
      render :edit
    end
  end

  private

  def lunch_params
    params.require(:lunch).permit(:image, :comment)
  end
end
