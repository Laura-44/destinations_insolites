require "open-uri"
# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Users
Reservation.destroy_all
Destination.destroy_all
User.destroy_all
user1 = User.create!(first_name: "Théo", last_name: "Martin", email: "theomartin@email.com", password: "123456789", address: "Nantes")
user2 = User.create!(first_name: "Léa", last_name: "Bernard", email: "leabernard@email.com", password: "987654321", address: "Caen")
user3 = User.create!(first_name: "Léo", last_name: "Pierre", email: "leopierre@email.com", password: "147258369", address: "Paris")

# Destinations
destination1 = Destination.create!(name: "La lune", description: "Marcher sur la lune", date_of_availability: "2023-12-27", price: 100000000, user_id: user1.id )
destination2 = Destination.create!(name: "ile paradisiaque", description: "Nager avec les dauphins", date_of_availability: "2023-12-27", price: 1000000, user_id: user2.id)
destination3 = Destination.create!(name: "Le désert", description: "Expérience insolite au milieu du désert", date_of_availability: "2023-12-27", price: 9000000, user_id: user1.id)
destination4 = Destination.create!(name: "igloo", description: "Une nuit rafraîchissante au chaud dans un igloo", date_of_availability: "2023-12-27", price: 5000000, user_id: user2.id)
destination5 = Destination.create!(name: "La cabane dans les arbres", description: "Expérience dans les arbres", date_of_availability: "2023-12-27", price: 4000000, user_id: user1.id)
destination6 = Destination.create!(name: "Le sous-marin", description: "Expérience inoubliable garantie", date_of_availability: "2023-12-27", price: 2000000, user_id: user2.id)
destination7 = Destination.create!(name: "La fusée", description: "Pour dormir avec les étoiles", date_of_availability: "2023-12-27", price: 1000000, user_id: user1.id)

# Photos
file = URI.open("https://res.cloudinary.com/dbpig7djd/image/upload/v1700573434/istockphoto-971852206-612x612_nnpw24.jpg")
destination1.photos.attach(io: file, filename: "Lune.png", content_type: "image/jpg")
destination1.save
file = URI.open("https://res.cloudinary.com/dbpig7djd/image/upload/v1700573434/istockphoto-157286122-612x612_cnit3x.jpg")
destination2.photos.attach(io: file, filename: "Ile.png", content_type: "image/jpg")
destination2.save
file = URI.open("https://res.cloudinary.com/dbpig7djd/image/upload/v1700573435/porte-du-desert-maroc_yvxqt6.jpg")
destination3.photos.attach(io: file, filename: "Désert.png", content_type: "image/jpg")
destination3.save
file = URI.open("https://res.cloudinary.com/dbpig7djd/image/upload/v1700573434/istockphoto-157286122-612x612_cnit3x.jpg")
destination4.photos.attach(io: file, filename: "Igloo.png", content_type: "image/jpg")
destination4.save
file = URI.open("https://res.cloudinary.com/dbpig7djd/image/upload/v1700573318/Bung2-300x246_huhvlw.jpg")
destination5.photos.attach(io: file, filename: "Cabane.png", content_type: "image/jpg")
destination5.save
file = URI.open("https://res.cloudinary.com/dbpig7djd/image/upload/v1700573318/800302_inline1_scale_450xauto_qims4x.jpg")
destination6.photos.attach(io: file, filename: "Sous-marin.png", content_type: "image/jpg")
destination6.save
file = URI.open("https://res.cloudinary.com/dbpig7djd/image/upload/v1700573318/9bd6468_524793604-for-press-release_mwa1ho.jpg")
destination7.photos.attach(io: file, filename: "Fusée.png", content_type: "image/jpg")
destination7.save!

#Reservations
reservation1 = Reservation.create(destination_id: destination1.id, user_id: user1.id)
reservation2 = Reservation.create(destination_id: destination2.id, user_id: user2.id)
reservation3 = Reservation.create(destination_id: destination1.id, user_id: user3.id)
