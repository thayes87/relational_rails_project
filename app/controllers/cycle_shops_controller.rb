class CycleShopsController < ApplicationController

  def index
    @cycle_shops = CycleShop.all
  end   
end