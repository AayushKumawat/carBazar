class HomesController < ApplicationController
  def index
    @homes = Car.all
  end
end
