class Reservation < ApplicationRecord
  belongs_to :customer

  def reservation_slot=(slot)
    hours = slot.split('#')
    self.start_on = hours.first
    self.end_on = hours.last
  end

  def reservation_slot
  end
end
