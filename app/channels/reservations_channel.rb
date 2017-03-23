class ReservationsChannel < ApplicationCable::Channel
  def subscribed
    stop_all_streams
    stream_from "reservations_channel"
  end

  def reserve(data)
    date = DateTime.parse(data['date']).in_time_zone("CET") rescue nil
    reservations = Reservation.where('start_on BETWEEN ? AND ?', date.beginning_of_day, date.end_of_day)
    slots = (0..24).to_a
    unavailable_slots = []
    reservations.each do |r|
       unavailable_slots << r.start_on.hour
       unavailable_slots << r.start_on.hour + 1
    end
    available_slots = (slots - unavailable_slots) << 0
    ActionCable.server.broadcast 'reservations_channel', slots: render_slots(available_slots)
  end

  private
  def render_slots(slots)
    ApplicationController.renderer.render(partial: 'reservations/slots', locals: { slots: slots, reservation: Reservation.new })
  end
end
