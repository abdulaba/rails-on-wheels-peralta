class Vehicle < ApplicationRecord
  has_many :rents
  belongs_to :user

  validates :user, :vehicle_type, :price, :seats, :description, presence: true
  validates :price, inclusion: { in: (1..10_000).to_a, message: "should be a number between 1 and 10,000" }
  validates :seats, inclusion: { in: (1..50).to_a, message: "should be a number between 1 and 50" }
  validates :description, length: { maximum: 120  }
  validates :vehicle_type, inclusion: { in: ["coupe", "sedan", "suv", "motorbike", "rv", "van", "bus"] }
end
