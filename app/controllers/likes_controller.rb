class LikesController < ApplicationController
  def create
    @car = Car.find_by(id: params[:car_id])
    @like = @car.likes.create
    if @like.save
      redirect_to cars_path
    end
  end
end
