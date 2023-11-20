class DestinationsController < ApplicationController
  def index
    @destinations = Destination.all
  end

  def show
    @destination = Destination.find(params[:id])
  end

  def new
    @destination = Destination.new
  end

  def create
    @destination = Destination.new(destination_params)
    redirect_to destination_path(@destination)
  end

  private

  def destination_params
    params.require(:destination).permit(:name, :description, :date_of_availability, :price)
  end
end

