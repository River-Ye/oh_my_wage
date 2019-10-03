FactoryBot.define do

  factory :admin, class: User do
    name { Faker::Movies::HarryPotter.character }
    number { Faker::Code.nric }
    password {'123123'}
    phone { ['09', 8.times.map{rand(10)}].join }
    sequence(:email, '001') { |n| "admin#{n}@123.123" }
    gender { [0, 1].sample }
    role { 0 }
  end

  factory :staff, class: User do
    name { Faker::Movies::HarryPotter.character }
    number { Faker::Code.nric }
    password {'123123'}
    phone { ['09', 8.times.map{rand(10)}].join }
    sequence(:email, '001') { |n| "t#{n}@123.123" }
    gender { [0, 1].sample }
    role { 1 }
  end
  
  factory :student, class: User do
    name { Faker::Movies::HarryPotter.character }
    number { Faker::Code.nric }
    password {'123123'}
    phone { ['09', 8.times.map{rand(10)}].join }
    sequence(:email, '001') { |n| "s#{n}@123.123" }
    gender { [0, 1].sample }
    role { 2 }
  end
end