class CycleShopsController < ApplicationController

  def index
    @cycle_shops = CycleShop.all.order(:created_at)
  end

  def show
    @shop = CycleShop.find(params[:id])
  end
end