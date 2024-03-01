# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'open-uri'

aaron_photo = URI.open("https://avatars.githubusercontent.com/u/87042274?v=4")
jose_photo =  URI.open("https://avatars.githubusercontent.com/u/64025392?v=4")
erika_photo = URI.open("https://avatars.githubusercontent.com/u/156470596?v=4")

puts "Creating users..."

erika = User.create(email: "erika.azuaje2014@gmail.com", password: "Patico2014",
                    first_name: "Erika", last_name: "Azuaje", nickname: "PaticoAzuaje",
                    phone_number: "01111111111")

erika.photo.attach(io: erika_photo, filename: "Erikaphoto", content_type: "image/png")

jose = User.create(email: "joseperalta2910@gmail.com", password: "123456",
                   first_name: "Jose", last_name: "Peralta", nickname: "Kronorit",
                   phone_number: "01111111111")

jose.photo.attach(io: jose_photo, filename: "Josephoto", content_type: "image/png")

aaron = User.create(email: "aarondlista@gmail.com", password: "holamundo2",
                    first_name: "Aaron", last_name: "Lista", nickname: "MotoMoto",
                    phone_number: "01111111111")

aaron.photo.attach(io: aaron_photo, filename: "Aaronphoto", content_type: "image/png")

puts "3 Users created"

puts 'creating vehicle for each user...'

cherokee_photo = URI.open("https://es.jeep.com/content/dam/fca-brands/na/jeep/en_us/2024/wrangler/gallery/desktop/MY24-Wrangler-Gallery-Exterior-1-Desktop.jpg.image.1440.jpg")
optra_photo = URI.open("https://media.chevrolet.com/dld/content/dam/Media/images/EC/Vehicles/Chevrolet/automoviles/Optra/2011/2011-Chevrolet-Optra-34AE24.jpg")
corolla_photo = URI.open("https://media.ed.edmunds-media.com/toyota/corolla/2023/oem/2023_toyota_corolla_sedan_xse_fq_oem_1_1280.jpg")

[erika, jose, aaron].each do |user|
  puts "creating 3 vehicles for #{user.first_name}"
  corolla = Vehicle.new(vehicle_type: 'sedan', seats: 4, price: 1000,
                 description: "Lorem ipsum dolor sit amet consectetur adipisicing
                 elit. Aut dignissimos quasi blanditiis praesentium",
                 make: "Toyota",
                 model: "Corolla", user: user, year: 2010)

  corolla.photos.attach([io: corolla_photo, filename: "corolla", content_type: "image/png"])

  puts corolla.save.valid?

  optra = Vehicle.create(vehicle_type: 'sedan', seats: 4, price: 2000,
                 description: "Lorem ipsum dolor sit amet consectetur adipisicing
                 elit. Aut dignissimos quasi blanditiis praesentium",
                 make: "Chevrolet",
                 model: "Optra", user: user, year: 2010)

  optra.photos.attach([io: optra_photo, filename: "optra", content_type: "image/png"])

  puts optra.save.valid?

  cherokee = Vehicle.create(vehicle_type: 'suv', seats: 4, price: 2500,
                 description: "Lorem ipsum dolor sit amet consectetur adipisicing
                 elit. Aut dignissimos quasi blanditiis praesentium",
                 make: "Jeep",
                 model: "Cherokee", user: user, year: 2010)

  cherokee.photos.attach([io: cherokee_photo, filename: "cherokee", content_type: "image/png"])

  puts cherokee.save.valid?
end
puts 'all vehicles created'

puts 'creating rents for vehicles'
[erika, jose, aaron].each do |owner|
  not_owner = [erika, jose, aaron].reject { |user| user == owner }
  owner.vehicles.each do |vehicle|
    puts Rent.create(vehicle: vehicle, user: not_owner.sample,
                start_date: "20240228", end_date: "20240328",
                price: vehicle.price).valid?
  end
end
puts 'all rents created'
