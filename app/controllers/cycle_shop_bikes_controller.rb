class CycleShopBikesController < ApplicationController
  def index 
    @cycle_shop = CycleShop.find(params[:id])
    @bikes = @cycle_shop.bikes
  end
end