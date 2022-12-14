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
    cycle_shop = CycleShop.create!(cycle_shop_params)
    redirect_to "/cycle_shops"
  end

  def edit
    @cycle_shop = CycleShop.find(params[:id])
  end
  
  def update
    shop = CycleShop.find(params[:id])
    cycle_shop = shop.update!(cycle_shop_params)
    redirect_to "/cycle_shops/#{shop.id}"
  end

  def delete
    shop = CycleShop.find(params[:id])
    shop.destroy
    redirect_to "/cycle_shops"
  end
  
private
  def cycle_shop_params
    params.permit(:name, :rental_program, :bike_capacity)
  end
end