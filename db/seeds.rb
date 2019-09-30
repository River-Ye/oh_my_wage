# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts "產生 1 筆 admin 權限帳號"
    FactoryBot.create(:admin)
puts "Done!"

puts "產生 20 筆 staff 權限帳號"
20.times do |i|    
    FactoryBot.create(:staff)
end
puts "Done!"


puts "產生 80 筆 student 權限帳號"
80.times do |i|    
    FactoryBot.create(:student)
end
puts "Done!"

puts "產生 9 個部門"
0.upto(8) do |i|
  Department.create(name: i)
end
puts "Done!"

puts "產生 20 筆 staff 與 Department 關聯資料"
2.upto(21) do |i|
  DepartmentWithUser.create(department_id: rand(1..9), user_id: i)
end
puts "Done!"

puts "產生 80 筆 student 與 Department 關聯資料"
80.times do |i|
  DepartmentWithUser.create(department_id: rand(1..9), user_id: rand(22..101))
end
puts "Done!"

puts "產生 150 筆 student 與 Salary 關聯"
150.times do |i|
  Salary.create(user_id: rand(22..101), hr: rand(1..12), hourly_wage: rand(150..500))
end
puts "Done!"

puts "請先看 Readme or seeds.rb 看產生哪些資料"