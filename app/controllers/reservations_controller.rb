class ReservationsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @reservations = Reservation.all
  end

  def new
    @reservation = Reservation.new
  end

  def create
  end
end
