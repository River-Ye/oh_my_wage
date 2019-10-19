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

puts "產生 2000 筆「學生」薪資紀錄"
2000.times do |i|
  Salary.create(user_id: rand(301..450),
                date: rand(280.days).seconds.ago,
                hr: rand(1..8),
                hourly_wage: 150)
end
puts "Done!"

puts "產生 Demo Day 操作之「職員」、「學生」帳號"
  # user_id 從 451 開始產生
  User.create(name: '鄧不利多', number: 'a000000', password: '000000', phone: '0988776655', email: 'a000@oh-my-wage', gender: 0, role: 0)
  User.create(name: '龍哥', number: 't000000', password: '123123', phone: '0988776655', email: 't000@oh-my-wage', gender: 0, role: 1)
  User.create(name: '哈利波特', number: 's000000', password: '123123', phone: '0988765432', email: 's000@oh-my-wage', gender: 0, role: 2)
  User.create(name: '陳宥誠', number: 's520520', password: '123123', phone: '0988765432', email: 's151@oh-my-wage', gender: 0, role: 2)
  # 魔法部的龍哥(職員)
  DepartmentWithUser.create(department_id: 1, user_id: 452)
  # 葛來分多的哈利波特(學生)
  DepartmentWithUser.create(department_id: 5, user_id: 453)
  # 哈利波特的24筆薪資
  24.times do |i|
    Salary.create(user_id: 453,
                  date: rand(280.days).seconds.ago,
                  hr: rand(1..8),
                  hourly_wage: 150)
  end
puts "Done!"

puts "請先看 「Readme」 or 「db/seeds.rb」 or 「factories/users.db」 看產生哪些資料"