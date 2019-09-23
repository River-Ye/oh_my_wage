# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts "Generating 10 students..."
5.times do |i|
  User.create(
  number: Faker::Code.asin,
  password: 'aaaaaa',
  name: Faker::Movies::HarryPotter.character,
  phone: Faker::PhoneNumber.cell_phone,
  subject: Faker::Movies::HarryPotter.house,
  role: 'student',
  email: Faker::Internet.email,
  gender: Faker::Gender.binary_type)
end
puts "Done!"

puts "Generating 10 stuffs..."
5.times do |i|
  User.create(
  number: Faker::Code.nric,
  password: 'aaaaaa',
  name: Faker::Movies::HarryPotter.character,
  phone: Faker::PhoneNumber.cell_phone,
  subject: [ '魔法部（The Ministry of Magic）',
             '黑魔法圖書館（Dark Magic Library）',
             '斜角巷福利社（Diagon Alley Store）',
             '活米村餐廳（Hogsmeade Village Cafeteria）',
             '萬應室（Room of Requirement)'].sample,
  email: Faker::Internet.email,
  gender: Faker::Gender.binary_type,
  role: 'stuff')
end
puts "Done!"

