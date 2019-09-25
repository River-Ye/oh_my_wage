# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts "Generating 5 students..."
5.times do |i|
  User.create(
  number: Faker::Code.asin,
  password: 'aaaaaa',
  name: Faker::Movies::HarryPotter.character,
  phone: ['09',8.times.map{rand(10)}].join,
  subject: ['葛來分多（Gryffindor）',
            '赫夫帕夫（Hufflepuff）',
            '雷文克勞（Ravenclaw）',
            '史萊哲林（Slytherin）'].sample,
  role: 'student',
  email: Faker::Internet.email,
  gender: Faker::Gender.binary_type)
end
puts "Done!"
 
   





puts "Generating 5 stuffs..."
5.times do |i|
  User.create(
  number: Faker::Code.nric,
  password: 'aaaaaa',
  name: Faker::Movies::HarryPotter.character,
  phone: ['09',8.times.map{rand(10)}].join,
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

