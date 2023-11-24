class ReservationsController < ApplicationController
  before_action :set_destination, only: %i[new create]

  def index
    # @reservations = Reservation.all
    @reservations = Reservation.where(user_id: current_user.id)
    raise
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def new
    @destination = Destination.find(params[:destination_id])
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    # @reservation.date_of_arrival=reservation_params[:date_of_arrival]
    raise
    @reservation.destination = @destination
    @reservation.user = current_user
    if @reservation.save!
      redirect_to destination_reservation_path(@destination, @reservation)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def accepted
    @reservation = Reservation.find(params[:id])
    @reservation.update(status: "Accepté")
    redirect_to reservations_path
  end

  def decline
    @reservation = Reservation.find(params[:id])
    @reservation.update(status: "Refusé")
    redirect_to reservations_path
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to destination_path(@reservation.destination), status: :see_other
  end

  private

  def set_destination
    @destination = Destination.find(params[:destination_id])
  end

  def reservation_params
    params.require(:reservation).permit(:status, :date_of_arrival, :date_of_departure)
  end
end
