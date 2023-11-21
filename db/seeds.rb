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
User.destroy_all
user1 = User.create!(first_name: "Théo", last_name: "Martin", email: "theomartin@email.com", password: "123456789", address: "Nantes")
user2 = User.create!(first_name: "Léa", last_name: "Bernard", email: "leabernard@email.com", password: "987654321", address: "Caen")
user3 = User.create!(first_name: "Léo", last_name: "Pierre", email: "leopierre@email.com", password: "147258369", address: "Paris")

# Destinations
destination1 = Destination.create!(name: "La lune", description: "Marcher sur la lune", date_of_availability: "2023-12-27", price: 100000000, user_id: user1.id )
destination2 = Destination.create!(name: "ile paradisiaque", description: "Nager avec les dauphins", date_of_availability: "2023-12-27", price: 1000000, user_id: user2.id)
puts "Coucou"
