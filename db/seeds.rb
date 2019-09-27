# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

FactoryBot.create(:admin)
FactoryBot.create(:staff)
FactoryBot.create(:student)

# FactoryBot.create(:staff)
# FactoryBot.create(:student)

# puts "Generating admin"
#   User.create(
#   number: Faker::Code.nric,
#   password: '123123',
#   name: Faker::Movies::HarryPotter.character,
#   phone: ['09', 8.times.map{rand(10)}].join,
#   email: "admin@123.123",
#   gender: [0, 1].sample,
#   role: 0)
# puts "Done!"

# puts "Generating 5 stuffs..."
# 5.times do |i|
#   User.create(
#   number: Faker::Code.nric,
#   password: '123123',
#   name: Faker::Movies::HarryPotter.character,
#   phone: ['09', 8.times.map{rand(10)}].join,
#   email: ['t', 5.times.map{ rand(10) }, "@123.123"].join,
#   gender: [0, 1].sample,
#   role: 1)
# end
# puts "Done!"

# puts "Generating 5 students..."
# 5.times do |i|
#   User.create(
#   number: Faker::Code.asin,
#   password: '123123',
#   name: Faker::Movies::HarryPotter.character,
#   phone: ['09', 8.times.map{rand(10)}].join,
#   email: ['s', 5.times.map{ rand(10) }, "@123.123"].join,
#   gender: [0, 1].sample,
#   role: 2)
# end
# puts "Done!"