class CycleShopsController < ApplicationController

  def index
    @cycle_shops = CycleShop.all
  end

  def show
    @shop = CycleShop.find(params[:id])
  end
end