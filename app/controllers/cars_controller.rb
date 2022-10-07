class CarsController < ApplicationController
before_action :authenticate_user!
before_action :set_id, only: [:show, :edit, :update, :destroy]
  def index
    @cars = Car.all
  end

  def show
    
  end

  def new
    @car = Car.new
  end

  def create
    @car = current_user.cars.create(car_params)
    if @car.save
      redirect_to @car
    else
      render :new
    end
  end

  def edit

  end

  def update
    
    if @car.update(car_params)
      redirect_to @car
    else
      render :new
    end
  end

  def destroy
   
    @car.destroy

    redirect_to cars_path
  end

  def buy
    @car = Car.where(brand:"TATA")
  end

  private
  def car_params
    params.require(:car).permit(:brand, :model, :price, :manufacture_year, :variant, images:[])
  end

  def set_id
  @car = Car.find(params[:id])
  end

end
