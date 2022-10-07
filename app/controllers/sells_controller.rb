class SellsController < ApplicationController
  before_action :authenticate_user!
  def index
    @sells = Sell.all
  end

  def show
    @sell = Sell.find(params[:id])
  end

  def new
    @sell = Sell.new
  end

  def create
    @sell = current_user.sells.create(sell_params)
    if @sell.save
      redirect_to @sell
    else
      render :new
    end
  end

  def edit
    @sell = Sell.find(params[:id])
  end

  def update
    @sell = Sell.find(params[:id])
    if @sell.update(sell_params)
      redirect_to @sell
    else
      render :edit
    end
  end

  private
  def sell_params
    params.require(:sell).permit(:brand, :model, :price, :variant, images:[])
  end

end
