# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts "Generating 5 users..."
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
  role: ['student', 'stuff'].sample,
  email: Faker::Internet.email,
  gender: Faker::Gender.binary_type)
end
puts "Done!"
 
   