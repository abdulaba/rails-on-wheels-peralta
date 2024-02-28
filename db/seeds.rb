# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Creating users..."

erika = User.create(email: "erika.azuaje2014@gmail.com", password: "Patico2014",
  first_name: "Erika", last_name: "Azuaje", nickname: "PaticoAzuaje")

jose = User.create(email: "joseperalta2910@gmail.com", password: "123456",
  first_name: "Jose", last_name: "Peralta", nickname: "Kronorit")

aaron = User.create(email: "aarondlista@gmail.com", password: "holamundo2",
  first_name: "Aaron", last_name: "Azuaje", nickname: "PaticoAzuaje")

puts "3 Users created"

puts 'creating vehicle for each user...'
[erika, jose, aaron].each do |user|
  puts "creating 3 vehicles for #{user.first_name}"
  Vehicle.new(vehicle_type: 'coupe', seats: 2, price: 1000,
              description: "lorem ipsum dolor", user: user)

  Vehicle.new(vehicle_type: 'sedan', seats: 4, price: 2000,
              description: "lorem ipsum dolor", user: user)

  Vehicle.new(vehicle_type: 'bus', seats: 15, price: 2500,
              description: "lorem ipsum dolor", user: user)
end
puts 'all vehicles created'

puts 'creating rents for each vehicle'
