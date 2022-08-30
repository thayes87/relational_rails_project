class CycleShopBikesController < ApplicationController
  def index 
    @cycle_shop = CycleShop.find(params[:id])
    if params[:sort].present?
      @bikes = @cycle_shop.bikes.order(params[:sort])
    else
      @bikes = @cycle_shop.bikes
    end
  end

  def new
    @cycle_shop = CycleShop.find(params[:id])
  end

  def create
    @cycle_shop = CycleShop.find(params[:id])
    @bike = @cycle_shop.bikes.create!(bike_params)
    redirect_to "/cycle_shop/#{@cycle_shop.id}/bikes"
  end

private
  def bike_params
    params.permit(:brand, :frame_size, :demo_available)
  end
end