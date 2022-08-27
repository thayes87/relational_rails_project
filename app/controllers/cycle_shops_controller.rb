class CycleShopsController < ApplicationController

  def index
    @cycle_shops = CycleShop.all.order(:created_at)
  end

  def show
    @shop = CycleShop.find(params[:id])
    @bike_count = @shop.bikes.count
  end

  def new

  end

  def create 
    cycle_shop = CycleShop.create!(
      name: params[:name], 
      rental_program: params[:rental_program],
      bike_capacity: params[:bike_capacity]
    )
    redirect_to "/cycle_shops/#{cycle_shop.id}"
  end
end