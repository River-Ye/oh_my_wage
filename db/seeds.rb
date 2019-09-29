# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Generating admin with factorybot..."
    FactoryBot.create(:admin)
puts "Done!"

puts "Generating 20 staffs with factorybot..."
20.times do |i|    
    FactoryBot.create(:staff)
end
puts "Done!"

puts "Generating 80 student with factorybot..."
80.times do |i|    
    FactoryBot.create(:student)
end
puts "Done!"

puts "Generating Department name..."
0.upto(8) do |i|
  Department.create(name: i)
end
puts "Done!"

puts "Generating 80 DepartmentWithUser name..."
80.times do |i|
  DepartmentWithUser.create(department_id: rand(1..9), user_id: rand(1..101))
end
puts "Done!"

puts "Generating 150 Salary..."
150.times do |i|
  Salary.create(user_id: rand(1..101), hr: rand(1..12), hourly_wage: rand(150..300))
end
puts "Done!"