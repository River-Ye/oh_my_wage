puts "產生 150 個「管理者」帳號, 請稍等..."
150.times do |i|
  FactoryBot.create(:admin)
end
puts "Done!"

puts "產生 150 個「職員」帳號, 請稍等..."
150.times do |i|
    FactoryBot.create(:staff)
end
puts "Done!"

puts "產生 150 個「學生」帳號, 請稍等..."
150.times do |i|
    FactoryBot.create(:student)
end
puts "Done!"

puts "產生 9 個部門名稱"
0.upto(8) do |i|
  Department.create(name: i)
end
puts "Done!"

puts "產生 150 筆「職員」與「部門」關聯"
151.upto(300) do |i|
  DepartmentWithUser.create(department_id: rand(1..9), user_id: i)
end
puts "Done!"

puts "產生 200 筆「學生」與「部門」關聯"
200.times do |i|
  DepartmentWithUser.create(department_id: rand(1..9), user_id: rand(301..450))
end
puts "Done!"

puts "產生 10000 筆「學生」薪資紀錄"
10000.times do |i|
  Salary.create(user_id: rand(301..450),
                date: rand(1.years).seconds.ago,
                hr: rand(4..8),
                hourly_wage: 150)
end
puts "Done!"

puts "請先看 Readme or seeds.rb 看產生哪些資料"