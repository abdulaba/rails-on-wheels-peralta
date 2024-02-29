class Vehicle < ApplicationRecord
  has_many :rents
  belongs_to :user

  # vehicles images

  has_many_attached :photos

  validates :user, :vehicle_type, :price, :seats, :description, :make, :model, :year, presence: true
  validates :price, inclusion: { in: (1..10_000).to_a, message: "should be a number between 1 and 10,000" }
  validates :seats, inclusion: { in: (1..50).to_a, message: "should be a number between 1 and 50" }
  validates :description, length: { minimum: 50, maximum: 120 }
  validates :make, :model, length: { maximum: 50 }
  validates :year, comparison: {
    greater_than_or_equal_to: 1960, message: "should be a year older than 1960",
    less_than_or_equal_to: Date.today.year
  }
  validates :vehicle_type, inclusion: { in: ["coupe", "sedan", "suv", "motorbike", "rv", "van", "bus"] }
end
