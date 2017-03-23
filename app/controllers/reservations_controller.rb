class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
  end

  def new
  end

  def create
  end
end
