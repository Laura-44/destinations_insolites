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

puts "Users"
Reservation.destroy_all
Destination.destroy_all
User.destroy_all
user1 = User.create!(first_name: "Théo", last_name: "Martin", email: "theomartin@email.com", password: "123456789", address: "Nantes")
user2 = User.create!(first_name: "Léa", last_name: "Bernard", email: "leabernard@email.com", password: "987654321", address: "Caen")
user3 = User.create!(first_name: "Léo", last_name: "Pierre", email: "leopierre@email.com", password: "147258369", address: "Paris")

puts "Destinations"
destination1 = Destination.create!(name: "Marcher sur la lune", description: "Explorez la surface de la lune avec cette expérience exceptionnelle. Marchez sur le sol lunaire, observez la Terre depuis l'espace et vivez des moments inoubliables sous le ciel étoilé de l'espace.", date_of_availability: "2023-12-27", price: 1000000, user_id: user1.id )
destination2 = Destination.create!(name: "ile paradisiaque", description: "Découvrez une île paradisiaque isolée où vous pourrez nager avec les dauphins, vous détendre sur des plages de sable blanc et explorer les merveilles sous-marines de l'océan. Une escapade tropicale de rêve!", date_of_availability: "2023-12-27", price: 50000, user_id: user2.id)
destination3 = Destination.create!(name: "Expérience insolite au milieu du désert", description: "Vivez une expérience unique au cœur du désert. Profitez du silence du sable infini, observez le coucher de soleil sur les dunes majestueuses et dormez sous un ciel étoilé spectaculaire.", date_of_availability: "2023-12-27", price: 9000, user_id: user1.id)
destination4 = Destination.create!(name: "Une nuit dans un igloo", description: "Passez une nuit rafraîchissante au chaud dans un igloo. Profitez de l'ambiance unique de cet hébergement polaire, avec la possibilité d'observer les aurores boréales depuis le confort de votre igloo.", date_of_availability: "2023-12-27", price: 5000, user_id: user2.id)
destination5 = Destination.create!(name: "La cabane dans les arbres", description: "Vivez une expérience magique dans une cabane perchée dans les arbres. Profitez de la nature, écoutez les oiseaux chanter le matin et découvrez le confort de cette retraite suspendue au-dessus du sol.", date_of_availability: "2023-12-27", price: 400, user_id: user1.id)
destination6 = Destination.create!(name: "Le sous-marin", description: "Embarquez pour une aventure sous-marine inoubliable. Séjournez à bord d'un véritable sous-marin, découvrez la vie marine fascinante et vivez des moments uniques sous les vagues.", date_of_availability: "2023-12-27", price: 2000000, user_id: user2.id)
destination7 = Destination.create!(name: "La fusée", description: "Dormez parmi les étoiles à bord d'une fusée spatiale. Cette expérience hors du commun vous permettra de vivre comme un astronaute, avec une vue imprenable sur l'espace infini.", date_of_availability: "2023-12-27", price: 10000000, user_id: user1.id)

puts "Photos"
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

puts "Reservations"
reservation1 = Reservation.create(destination_id: destination1.id, user_id: user1.id)
reservation2 = Reservation.create(destination_id: destination2.id, user_id: user2.id)
reservation3 = Reservation.create(destination_id: destination1.id, user_id: user3.id)
