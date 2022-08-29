class BikesController < ApplicationController
  def index
    @bikes = Bike.where(demo_available: true)
  end

  def show
    @bike = Bike.find(params[:id])
  end

  def edit
    @bike = Bike.find(params[:id])
  end

  def update
    @bike = Bike.find(params[:id])
    @b = @bike.update!(bike_params)
    redirect_to "/bikes/#{@bike.id}"
  end
  
  def delete
    @bike = Bike.find(params[:id])
    @bike.destroy
    redirect_to "/bikes"
  end

private
  def bike_params
    params.permit(:brand, :frame_size, :demo_available)
  end
end