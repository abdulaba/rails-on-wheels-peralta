class User < ApplicationRecord
  has_many :vehicles
  has_many :rents

  # user image

  has_one_attached :photo
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, :last_name, presence: true
  validates :nickname, presence: true, uniqueness: true
  validates :phone_number, presence: true, format: { with: /\A(\+|0)\d*/ }
end
