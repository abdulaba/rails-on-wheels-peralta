class Rent < ApplicationRecord
  belongs_to :vehicle
  belongs_to :user

  validate :start_date_cannot_be_in_the_past, :end_date_cannot_be_minor_start_date

  validates :vehicle, :user, :start_date, :end_date, :price, presence: true

  def start_date_cannot_be_in_the_past
    errors.add(:start_date, "can't be in the past") if start_date.present? && start_date < Date.today
  end

  def end_date_cannot_be_minor_start_date
    errors.add(:end_date, "can't be in the less or equal to start date") if end_date.present? && end_date <= start_date
  end
end
