class Rent < ApplicationRecord
  belongs_to :vehicle
  belongs_to :user

  validates :vehicle, :user, :start_date, :end_date, :price, presence: true
  validates :price, inclusion: { in: (1..10_000).to_a }
end
