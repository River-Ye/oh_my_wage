# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# puts "Generating admin with factorybot..."
#     FactoryBot.create(:admin)
# puts "Done!"

puts "Generating 10 stuffs with factorybot..."
10.times do |i|    
    FactoryBot.create(:staff)
end
puts "Done!"

puts "Generating Department name"
(0..8).each do |i|
  Department.create(
    name: i
  )
end
