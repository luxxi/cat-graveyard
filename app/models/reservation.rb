class Reservation < ApplicationRecord
  belongs_to :customer

  validate :start_on_date_cannot_be_in_the_past

  def start_on_date_cannot_be_in_the_past
    if start_on.present? && start_on < Date.today
      errors.add(:start_on, "can't be in the past")
    end
  end

  def reservation_slot=(slot)
    hours = slot.split('#')
    self.start_on = hours.first
    self.end_on = hours.last
  end

  def reservation_slot
  end
end
