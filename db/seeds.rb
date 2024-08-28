# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "destroying all users"
User.destroy_all

puts "creating users..."

user1 = User.create!(email: "pessoa@gmail.com", password: "123456")
user2 = User.create!(email: "user@gmail.com", password: "123456")
user3 = User.create!(email: "abc@gmail.com", password: "123456")
user4 = User.create!(email: "tomas@gmail.com", password: "123456")
user5 = User.create!(email: "thaila@gmail.com", password: "123456")
user6 = User.create!(email: "paulo@gmail.com", password: "123456")

puts "users created"

puts "creating places..."

Place.create!(name: "casa na praia", location: "praia", description: "bom", price: 100, rating: 4, user: user1)
Place.create!(name: "casa na montanha", location: "montanha", description: "ruim", price: 100, rating: 2, user: user2)
Place.create!(name: "casa na floresta", location: "floresta", description: "bom", price: 100, rating: 4, user: user3)
Place.create!(name: "casa no deserto", location: "deserto", description: "ok", price: 100, rating: 3, user: user4)
Place.create!(name: "casa na cidade", location: "cidade", description: "péssimo", price: 100, rating: 1, user: user5)
Place.create!(name: "casa na Bahia", location: "Bahia", description: "maravilhoso", price: 100, rating: 5, user: user6)
Place.create!(name: "casa no Maranhão", location: "Maranhão", description: "excelente", price: 100, rating: 4.5, user: user1)
Place.create!(name: "casa no Rio", location: "RJ", description: "bom", price: 100, rating: 3.5, user: user2)
Place.create!(name: "casa no Tocantins", location: "Tocantins", description: "muito bom", price: 100, rating: 4.2, user: user3)
Place.create!(name: "casa em Belém", location: "Belém", description: "razoável", price: 100, rating: 3.4, user: user4)
Place.create!(name: "casa no Guarujá", location: "Guarujá", description: "bom", price: 100, rating:3.8, user: user5)
Place.create!(name: "casa em SP", location: "SP", description: "ótimo", price: 100, rating: 4.3, user: user6)

puts "places created"

puts "creating bookings..."

Booking.create!()

puts "bookings created"
