require 'open_weather'
class ReservationsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @reservations = Reservation.all
    options = { units: "metric", APPID: ENV['OPEN_WEATHER_API_KEY'] }
    @weather = OpenWeather::ForecastDaily.city("Ljubljana, SI", options)
  end

  def new
    @reservation = Reservation.new
  end

  def show
    date = DateTime.parse(params[:id]) rescue nil
    @reservations = Reservation.where('start_on BETWEEN ? AND ?', date.beginning_of_day, date.end_of_day)
    respond_to :js
  end

  def create
    @reservation = current_customer.reservations.build(reservation_params)
    if @reservation.save
      redirect_to reservations_path, notice: 'Reservation was successfully created.'
    else
      render :new
    end
  end

  private
    def reservation_params
      params.require(:reservation).permit(:reservation_slot, :start_on, :end_on)
    end
end
