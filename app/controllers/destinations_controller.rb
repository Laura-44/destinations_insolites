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
    @destination.user = current_user
    @destination.save
    redirect_to destination_path(@destination)
  end


  # def create
  #   @destination = current_user.destination.build(destination_params)

  #   if @destination.save
  #     redirect_to destination_path(@destination), notice: 'Destination created successfully.'
  #   else
  #     render :new, status: :unprocessable_entity
  #   end
  # end

  private

  def destination_params
    params.require(:destination).permit(:name, :description, :date_of_availability, :price, :user_id, photos: [])
  end
end
