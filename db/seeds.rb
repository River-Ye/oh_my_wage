puts "Generate 150 items admin account ing, please waiting"
150.times do |i|
  FactoryBot.create(:admin)
end
puts "Done!"

puts "Generate 150 items staff account ing, please waiting"
150.times do |i|
    FactoryBot.create(:staff)
end
puts "Done!"

puts "Generate 300 items student account ing, please waiting"
300.times do |i|
    FactoryBot.create(:student)
end
puts "Done!"

puts "Generate 300 items Department name"
0.upto(8) do |i|
  Department.create(name: i)
end
puts "Done!"

puts "Generate 150 items staff and Department ORM"
151.upto(300) do |i|
  DepartmentWithUser.create(department_id: rand(1..9), user_id: i)
end
puts "Done!"

puts "Generate 300 items student and Department ORM"
300.times do |i|
  DepartmentWithUser.create(department_id: rand(1..9), user_id: rand(301..600))
end
puts "Done!"

puts "Generate 600 items student and Salary ORM"
600.times do |i|
  Salary.create(user_id: rand(301..600),
                date: rand(1.years).seconds.ago,
                hr: rand(1..12),
                hourly_wage: [150, 155, 160, 165, 170, 180, 200].sample)
end
puts "Done!"

puts "請先看 Readme or seeds.rb 看產生哪些資料"