class ReservationsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @reservations = Reservation.all
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = current_customer.reservations.build(reservation_params)
    if @reservation.save
      redirect_to reservations_path, notice: 'Testpp was successfully created.'
    else
      render :new
    end
  end

  private
    def reservation_params
      params.require(:reservation).permit(:reservation_slot, :start_on, :end_on)
    end
end
